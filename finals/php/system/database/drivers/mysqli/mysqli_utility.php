<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 5.1.6 or newer
 *
 * @package		CodeIgniter
 * @author		ExpressionEngine Dev Team
 * @copyright	Copyright (c) 2008 - 2011, EllisLab, Inc.
 * @license		http://codeigniter.com/user_guide/license.html
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * MySQLi Utility Class
 *
 * @category	Database
 * @author		ExpressionEngine Dev Team
 * @link		http://codeigniter.com/user_guide/database/
 */
class CI_DB_mysqli_utility extends CI_DB_utility {

	/**
	 * List databases
	 *
	 * @access	private
	 * @return	bool
	 */
	function _list_databases()
	{
		return "SHOW DATABASES";
	}

	// --------------------------------------------------------------------

	/**
	 * Optimize table query
	 *
	 * Generates a platform-specific query so that a table can be optimized
	 *
	 * @access	private
	 * @param	string	the table name
	 * @return	object
	 */
	function _optimize_table($table)
	{
		return "OPTIMIZE TABLE ".$this->db->_escape_identifiers($table);
	}

	// --------------------------------------------------------------------

	/**
	 * Repair table query
	 *
	 * Generates a platform-specific query so that a table can be repaired
	 *
	 * @access	private
	 * @param	string	the table name
	 * @return	object
	 */
	function _repair_table($table)
	{
		return "REPAIR TABLE ".$this->db->_escape_identifiers($table);
	}

	// --------------------------------------------------------------------

	/**
	 * MySQLi Export
	 *
	 * @access	private
	 * @param	array	Preferences
	 * @return	mixed
	 */
function _backup($params = array())
{
    // Currently unsupported
    //---return $this->db->display_error('db_unsuported_feature');

    if (count($params) == 0)
    {
        return FALSE;
    }

    // Extract the prefs for simplicity
    extract($params);

    // Build the output
    $output = '';
    foreach ((array)$tables as $table)
    {

        // Temp file to reduce change of OOM Killer
        $tempfilepath = APPPATH . DIRECTORY_SEPARATOR . 'cache' . DIRECTORY_SEPARATOR;
        $tempfile = $tempfilepath . 'dbbkp_tmp_' . time() . '.sql';

        // Is the table in the "ignore" list?
        if (in_array($table, (array)$ignore, TRUE))
        {
            continue;
        }

        // Get the table schema
        $query = $this->db->query("SHOW CREATE TABLE `".$this->db->database.'`.`'.$table.'`');

        // No result means the table name was invalid
        if ($query === FALSE)
        {
            continue;
        }

        // Write out the table schema
        $output .= '#'.$newline.'# TABLE STRUCTURE FOR: '.$table.$newline.'#'.$newline.$newline;

        if ($add_drop == TRUE)
        {
            $output .= 'DROP TABLE IF EXISTS '.$table.';'.$newline.$newline;
        }

        $i = 0;
        $result = $query->result_array();
        foreach ($result[0] as $val)
        {
            if ($i++ % 2)
            {
                $output .= $val.';'.$newline.$newline;
            }
        }

        // Write $output to the $filename file
        file_put_contents( $filename, $output, LOCK_EX );
        $output = '';

        // If inserts are not needed we're done...
        if ($add_insert == FALSE)
        {
            continue;
        }

        // Grab all the data from the current table
        //$query = $this->db->query("SELECT * FROM $table"); // OLD
        $countResult = $this->db->query("SELECT COUNT(*) AS `count` FROM " . $table . ";");
        $countReturn = $countResult->result_array();
        $totalCount = $countReturn[0]['count'];

        //if ($query->num_rows() == 0) // OLD
        if ($totalCount == 0)
        {
            continue;
        }

        // Chunk Vars
        $chunkSize = 10000;
        $from      = 0;
        $resultArray = array();

        if (isset($chunk_size))
        {
            $chunkSize = $chunk_size;
        }

        // Write out the table schema
        $output .= '#'.$newline.'# TABLE DATA FOR: '.$table.$newline.'#'.$newline.$newline;

        // Write $output to the $filename file
        file_put_contents( $filename, $output, FILE_APPEND | LOCK_EX );

        // Fetch the field names and determine if the field is an
        // integer type.  We use this info to decide whether to
        // surround the data with quotes or not
        $query = $this->db->query("SELECT * FROM " . $table . " LIMIT 1;");
        $i = 0;
        $field_str = '';
        $is_int = array();
        while ($field = mysqli_fetch_field($query->result_id))
        {
            // Most versions of MySQL store timestamp as a string
            $is_int[$i] = (in_array(
                                    //strtolower(mysqli_field_type($query->result_id, $i)),
                                    strtolower($field->type),
                                    array('tinyint', 'smallint', 'mediumint', 'int', 'bigint'), //, 'timestamp'),
                                    TRUE)
                                    ) ? TRUE : FALSE;

            // Create a string of field names
            $field_str .= '`'.$field->name.'`, ';
            $i++;
        }

        // Trim off the end comma
        $field_str = preg_replace( "/, $/" , "" , $field_str);

        // Pull the data in chunks
        while($from < $totalCount)
        {
            // empty $output
            $output = '';

            // Execute a limited query:
            $dataChunkQuery = $this->db->query('SELECT * FROM ' . $table . ' LIMIT ' . $from . ', ' . $chunkSize . ';');
            $dataChunkRows = $dataChunkQuery->result_array();

            // Increase $from:        
            $from += $chunkSize;

            // Build the insert string
            //foreach ($query->result_array() as $row) // OLD
            //var_dump($resultArray); die();
            foreach ($dataChunkRows as $row)
            {
                $val_str = '';

                $i = 0;
                foreach ($row as $v)
                {
                    // Is the value NULL?
                    if ($v === NULL)
                    {
                        $val_str .= 'NULL';
                    }
                    else
                    {
                        // Escape the data if it's not an integer
                        if ($is_int[$i] == FALSE)
                        {
                            $val_str .= $this->db->escape($v);
                        }
                        else
                        {
                            $val_str .= $v;
                        }
                    }

                    // Append a comma
                    $val_str .= ', ';
                    $i++;
                }

                // Remove the comma at the end of the string
                $val_str = preg_replace( "/, $/" , "" , $val_str);

                // Build the INSERT string
                $output .= 'INSERT INTO '.$table.' ('.$field_str.') VALUES ('.$val_str.');'.$newline;
            }

            // Write $output to the $filename file
            file_put_contents( $filename, $output, FILE_APPEND | LOCK_EX );

            sleep(1); // used to help reduce the CPU load
        }

    }

    if( file_exists($filename) ) {
        return true;
    } else {
        return false;
    }

}
}
