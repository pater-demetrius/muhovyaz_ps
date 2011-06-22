<?php
class Validate extends ValidateCore
{
	static public function isWeightUnit($unit)
	{
		return preg_match('/^[[:alpha:]А-Яа-я]{1,3}$/ui', $unit);
	}
	
	static public function isDistanceUnit($unit)
	{
		return preg_match('/^[[:alpha:]А-Яа-я]{1,2}$/ui', $unit);
	}
}