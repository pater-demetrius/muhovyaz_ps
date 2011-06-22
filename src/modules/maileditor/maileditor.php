<?php

class Maileditor extends Module
{
	/** @var max image size */
	protected $maxImageSize = 307200;

	function __construct()
	{
		$this->name = 'maileditor';
		$this->tab = 'Tools';
		$this->version = '1.0';
		
		parent::__construct();
		
		$this->displayName = $this->l('Редактор шаблонов писем');
		$this->description = $this->l('Редактор шаблонов писем.');
	}

	function install()
	{
		if (!parent::install())
			return false;
	}
    function putContents()
    {
        $languages = Language::getLanguages();
        foreach ($languages as $language)
        {
            $this->_putMailFileContents( $language ) ;
        }
    }
	function getContent()
	{

		/* display the module name */
		$this->_html = '<h2>'.$this->displayName.'</h2>';
		$errors = '';

		if (Tools::GetValue('submitUpdate'))
		{
	            $this->putContents() ;
		}

		$this->_html .= $this->_displayForm();
	
		return $this->_html;
	}
    private function _displayMailTemplates()
    {

		$defaultLanguage = intval(Configuration::get('PS_LANG_DEFAULT'));
		$languages = Language::getLanguages();
		$iso = Language::getIsoById($defaultLanguage);

        $dir = dirname(__FILE__) . "/../../mails/". $iso . "/" ;
        $files = scandir( $dir ) ;
        $cnt = count($files) ;
        $html = '<form method="post" action="'.$_SERVER['REQUEST_URI'].'" >
			<fieldset style="width: 900px;">
				<legend><img src="'.$this->_path.'logo.gif" alt="" title="" /> '.$this->displayName.'</legend>
				<label>'.$this->l('Найденные шаблоны').'</label><br/><br/><br/>' ;
        $html .= '<table class="table">
                    <th>Имя файла</th><th>Править</th>';

        $tokenModules = Tools::GetValue('token') ;

        for( $i = 0; $i < $cnt; $i ++ )
        {
            if( preg_match('/.html$/', $files[$i]) )
            {
                $link = '<a href="index.php?tab=AdminModules&token=' . $tokenModules . '&configure=' . urlencode($this->name) . '&file='.$files[$i].'">' ;
                $link .= '<img src="' . __PS_BASE_URI__ . 'img/admin/edit.gif" /></a>' ;

                $html .= '<tr>
                        <td style="float:left;">'. $files[$i] . '</td>
                        <td>'.$link.'</td>
                      </tr>' ;
            }
        }
        $html .= '</table>' ;
        $html .= '</fieldset>' ;
        $html .= '</form>' ;
        return $html ;
    }
	private function _displayForm()
	{
        $html = $this->_displayMailTemplates() ;

        if( !Tools::GetValue('file') )
        {
            return $html ;
        }
		global $cookie;
		
		/* Languages preliminaries */
		$defaultLanguage = intval(Configuration::get('PS_LANG_DEFAULT'));
		$languages = Language::getLanguages();
		$iso = Language::getIsoById($defaultLanguage);
		$divLangName = 'cpara';

		$html .= '
		<script type="text/javascript" src="'.__PS_BASE_URI__.'js/tinymce/jscripts/tiny_mce/jquery.tinymce.js"></script>
		<script type="text/javascript">
		function tinyMCEInit(element)
		{
			$().ready(function() {
				$(element).tinymce({
					// Location of TinyMCE script
					script_url : \''.__PS_BASE_URI__.'js/tinymce/jscripts/tiny_mce/tiny_mce.js\',
					// General options
					theme : "advanced",
					forced_root_block : false,
					force_br_newlines : true,
					force_p_newlines : false,
					plugins : "safari,pagebreak,style,layer,table,advimage,advlink,inlinepopups,preview,media,searchreplace,contextmenu,paste,directionality,fullscreen",
					// Theme options
					theme_advanced_buttons1 : "newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
					theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
					theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,media,|,|,ltr,rtl,|,fullscreen",
					theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,pagebreak",
					theme_advanced_toolbar_location : "top",
					theme_advanced_toolbar_align : "left",
					theme_advanced_statusbar_location : "bottom",
					theme_advanced_resizing : true,
					// Drop lists for link/image/media/template dialogs
					template_external_list_url : "lists/template_list.js",
					external_link_list_url : "lists/link_list.js",
					external_image_list_url : "lists/image_list.js",
					media_external_list_url : "lists/media_list.js"
				});
			});
		}
		tinyMCEInit(\'textarea.rte\');
		</script>
		<script type="text/javascript">id_language = Number('.$defaultLanguage.');</script>
		<form method="post" action="'.$_SERVER['REQUEST_URI'].'">
			<fieldset style="width: 900px;">
				<legend><img src="'.$this->_path.'logo.gif" alt="" title="" />HTML содержимое шаблона</legend>
				<div class="margin-form">';
				
		$html .= '
					<div class="clear"></div>
				</div>
				<label>'.$this->l('HTML').'</label>
				<div class="margin-form">';

				foreach ($languages as $language)
				{
                    			$existing_file = stripslashes($this->_getMailFileContents( $language ) ) ;
					
					$html .= '
					<div id="cpara_'.$language['id_lang'].'" style="display: '.($language['id_lang'] == $defaultLanguage ? 'block' : 'none').';float: left;">
						<textarea class="rte" cols="70" rows="30" id="body_mail_'.$language['id_lang'].'" name="body_mail_'.$language['id_lang'].'">' . $existing_file . '</textarea>
					</div>';
				 }

				$html .= $this->displayFlags($languages, $defaultLanguage, $divLangName, 'cpara', true);
				
				$html .= '
					<div class="clear"></div>
				</div>';


				$html .= '<label>'.$this->l('Text').'</label>
				<div class="margin-form">';

				foreach ($languages as $language)
				{
                   			 $text_file = stripslashes($this->_getMailFileContents( $language ,true) ) ;
					$html .= '
					<div id="textcpara_'.$language['id_lang'].'" style="display: '.($language['id_lang'] == $defaultLanguage ? 'block' : 'none').';float: left;">
						<textarea cols="70" rows="30" id="body_textmail_'.$language['id_lang'].'" name="body_textmail_'.$language['id_lang'].'">' . $text_file . '</textarea>
					</div>';
				 }

				$html .= $this->displayFlags($languages, $defaultLanguage, $divLangName, 'cpara', true);
				
				$html .= '
					<div class="clear"></div>
				</div>';

				$html .= '<div class="clear pspace"></div>
				<div class="margin-form clear"><input type="submit" name="submitUpdate" value="'.$this->l('Update the file').'" class="button" /></div>
			</fieldset>
		</form>';
        return $html ;
	}

    function _putMailFileContents( $lang)
    {

        $filename = Tools::GetValue('file');
        if( !$filename )
        {
            return "" ;
        }

		$path_info = pathinfo($filename);
		$textfilename=$path_info['filename'].'.txt';
		$contents .= Tools::GetValue('body_textmail_' . $lang['id_lang']);
		$file = dirname(__FILE__) . "/../../mails/". $lang['iso_code'] . "/" . $textfilename ;
		file_put_contents( $file, stripslashes($contents) ) ;

		$contents = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd"><html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head><body>';
	        $contents .= Tools::GetValue('body_mail_' . $lang['id_lang']);
		$contents .= '</body></html>';
	        $file = dirname(__FILE__) . "/../../mails/". $lang['iso_code'] . "/" . $filename ;
	        file_put_contents( $file, stripslashes($contents) ) ;

    }
    function _getMailFileContents( $lang, $text=false )
    {
        if( !Tools::GetValue('file') )
        {
            return "" ;
        }
        $filename = Tools::GetValue('file') ;
	if ($text) {
		$path_info = pathinfo($filename);
		$filename=$path_info['filename'].'.txt';
	}
        if( !$filename )
        {
            return "" ;
        }

        $file = dirname(__FILE__) . "/../../mails/". $lang['iso_code'] . "/" . $filename ;
        $cotents = @file_get_contents( $file ) ;
        return $cotents ;
    }
}

?>