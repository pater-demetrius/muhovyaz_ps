<?php

class Tools extends ToolsCore
{
	static public function link_rewrite($str, $utf8_decode = false)
	{
    if (preg_match('/[А-Яа-я]+/', $str)){
			$cyr = array('а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я');
			$lat = array('a', 'b', 'v', 'g', 'd', 'e', 'jo', 'zh', 'z', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'h', 'c', 'ch', 'sh', 'sch', '', 'y', '', 'e', 'ju', 'ja');
			$str = mb_strtolower($str, 'utf-8');
			$str = str_replace($cyr, $lat, $str);
		}
		return parent::link_rewrite($str, $utf8_decode);
	}
}