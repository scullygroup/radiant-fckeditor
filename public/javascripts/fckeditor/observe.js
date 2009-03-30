function instantiateFCKEditor(partName){
	var usedFilter = $('part_' + partName +'_filter_id');
	if(usedFilter.value == 'Fckeditor'){
		putInEditor(partName);
	}
}

function toggleEditor(partName){
	var filterId = $('part_' + partName + '_filter_id');
	if(filterId.value == 'Fckeditor'){
		putInEditor(partName);
	} else {
		removeEditor(partName);
	}
}

function removeEditor(partName){
	var editorInstance = FCKeditorAPI.GetInstance('part_' + partName + '_content');
	editorInstance.UpdateLinkedField();
	var editorContainer = $('part_' + partName + '_content___Frame');
	if(editorContainer){
		editorContainer.parentNode.removeChild( editorContainer );
	}
	var textareaContainer = $('part_' + partName + '_content');
	textareaContainer.style.display = '';
}

function putInEditor(partName){
	var oFCKeditor = new FCKeditor('part_' + partName + '_content', '600px', '600px', 'Default');
	var page_type = $F('page_class_name');
	oFCKeditor.BasePath = "/javascripts/fckeditor/"
	oFCKeditor.Config['CustomConfigurationsPath'] = '/fckeditor/config?class_name=' + page_type;
	oFCKeditor.Width = '100%' ;
	oFCKeditor.Height = '350' ;
	oFCKeditor.ReplaceTextarea();
}
