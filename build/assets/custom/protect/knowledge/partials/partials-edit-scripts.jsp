<%@page pageEncoding="UTF-8" isELIgnored="false" session="false" errorPage="/WEB-INF/views/commons/errors/jsp_error.jsp"%>
<%@page import="org.support.project.common.util.StringUtils"%>
<%@page import="org.support.project.knowledge.logic.KnowledgeLogic"%>
<%@page import="org.support.project.web.util.JspUtil"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<% JspUtil jspUtil = new JspUtil(request, pageContext); %>

<script type="text/x-mathjax-config">
MathJax.Hub.Config({
    tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]},
    skipStartupTypeset: true
  });
</script>
<script type="text/javascript" src="<%= request.getContextPath() %>/bower/MathJax/MathJax.js?config=TeX-AMS-MML_HTMLorMML,Safe"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/bower/emoji-parser/main.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/bower/jspdf/dist/jspdf.min.js"></script>

<script src="<%= request.getContextPath() %>/js/page-knowledge-edit-922a465d56.js"></script>

<script>
var _UPLOADED = '<%= jspUtil.label("knowledge.edit.label.uploaded") %>';
var _DELETE_LABEL= '<%= jspUtil.label("label.delete") %>';
var _FAIL_UPLOAD = '<%= jspUtil.label("knowledge.edit.label.fail.upload") %>';
var _REMOVE_FILE = '<%= jspUtil.label("knowledge.edit.label.delete.upload") %>';
var _FAIL_REMOVE_FILE = '<%= jspUtil.label("knowledge.edit.label.fail.delete.upload") %>';
var _CONFIRM = '<%= jspUtil.label("knowledge.edit.label.confirm.delete") %>';
var _SET_IMAGE_LABEL= '<%= jspUtil.label("knowledge.edit.set.image.path") %>';
var _SET_SLIDE_LABEL= '<%= jspUtil.label("knowledge.edit.set.slide.path") %>';
var _LABEL_UPDATE = '<%= jspUtil.label("label.update") %>';
var _UPDATE_TITLE = '<%= jspUtil.label("knowledge.edit.title") %>';
var _IMAGE_UPLOAD = '<%= jspUtil.label("knowledge.edit.image.upload") %>';

var _ANSWER_DATETIME = '<%= jspUtil.label("knowledge.survey.label.answer.date") %>';
var _ANSWER_USER = '<%= jspUtil.label("knowledge.survey.label.answer.user") %>';

var _TAGS = [];
var tagname;
<c:forEach var="tagitem" items="${tagitems}" varStatus="status">
tagname = unescapeHTML('<%= jspUtil.out("tagitem.tagName") %>');
_TAGS.push(tagname);
</c:forEach>

preview();

debounceTime = 1000;
debounceId = null

$('#content').on('input propertychange', function()
{
    if (debounceId)
    {
      clearTimeout(debounceId);
    }
    debounceId = setTimeout(function()
    {
      preview();
    }, debounceTime);
});
    
function onEditorSelected()
{
    $("#write_helper").show();
    $("#writeable").removeClass("col-md-6").addClass("col-md-12").show();
    $("#previewTab").removeClass("col-md-6 col-md-12").hide();
    $("#preview").removeClass("preview_scroll");
    $("#content_top").removeClass("container-fluid").addClass("container");
}

function onPreviewSelected()
{
    $("#write_helper").hide();
    $("#writeable").removeClass("col-md-6 col-md-12").hide();
    $("#previewTab").removeClass("col-md-6").addClass("col-md-12").show();
    $("#preview").removeClass("preview_scroll");
    $("#content_top").removeClass("container-fluid").addClass("container");
}

function onSplitSelected()
{
    $("#write_helper").show();
    $("#writeable").removeClass("col-md-12").addClass("col-md-6").show();
    $("#previewTab").removeClass("col-md-12").addClass("col-md-6").show();
    $("#preview").addClass("preview_scroll");
    $("#content_top").removeClass("container").addClass("container-fluid");
}

$('input[type=radio][name=edit-mode]').on("change", function()
{
  switch(this.id)
  {
  case "edit-mode-source":  onEditorSelected(); break;
  case "edit-mode-preview": onPreviewSelected(); break;
  case "edit-mode-split":   onSplitSelected(); break;
  default: break;
  }
});

</script>

