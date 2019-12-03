<%@page pageEncoding="UTF-8" isELIgnored="false" session="false" errorPage="/WEB-INF/views/commons/errors/jsp_error.jsp"%>
<%@page import="org.support.project.common.util.StringUtils"%>
<%@page import="org.support.project.knowledge.logic.KnowledgeLogic"%>
<%@page import="org.support.project.web.util.JspUtil"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<% JspUtil jspUtil = new JspUtil(request, pageContext); %>
    <input type="hidden" name="offset" value="<%= jspUtil.out("offset") %>" />
    <input type="hidden" name="keyword" value="<%= jspUtil.out("keyword") %>" />
    <input type="hidden" name="tag" value="<%= jspUtil.out("tag") %>" />
    <input type="hidden" name="user" value="<%= jspUtil.out("user") %>" />
    
    <!-- items -->
    <div class="form-group" id="template_items">
    </div>

    <!-- contents -->
    <div class="form-group">
        <div class="btn-group" data-toggle="buttons">
          <label class="btn btn-default active">
            <input id="edit-mode-source" type="radio" name="edit-mode" autocomplete="off" checked><%= jspUtil.label("knowledge.add.label.content") %>
          </label>
          <label class="btn btn-default">
            <input id="edit-mode-preview" type="radio" name="edit-mode" autocomplete="off"><%= jspUtil.label("label.preview") %>
          </label>
          <label class="btn btn-default">
            <input id="edit-mode-split" type="radio" name="edit-mode" autocomplete="off">Split
          </label>
        </div>
        <div id="write_helper">
          <a data-toggle="modal" href="<%= request.getContextPath()%>/open.emoji/people" data-target="#emojiPeopleModal">people</a>
          <a data-toggle="modal" href="<%= request.getContextPath()%>/open.emoji/nature" data-target="#emojiNatureModal">nature</a>
          <a data-toggle="modal" href="<%= request.getContextPath()%>/open.emoji/objects" data-target="#emojiObjectsModal">objects</a>
          <a data-toggle="modal" href="<%= request.getContextPath()%>/open.emoji/places" data-target="#emojiPlacesModal">places</a>
          <a data-toggle="modal" href="<%= request.getContextPath()%>/open.emoji/symbols" data-target="#emojiSymbolsModal">symbols</a>
          <span class="helpMarkdownLabel pull-right">
              <a data-toggle="modal" data-target="#helpMarkdownModal"><i class="fa fa-info-circle" aria-hidden="true"></i>Markdown information</a>
          </span>
        </div>
            <style>
              .preview_scroll
              {
                overflow: scroll;
                resize: vertical;
                height: 400px;
              }
            </style>
        <div>

            <div id="writeable" class="col-md-12">
                <textarea class="form-control" style="resize: vertical; height: 400px;" name="content" placeholder="<%= jspUtil.label("knowledge.add.label.content") %>" id="content"><%= jspUtil.out("content") %></textarea>
            </div>

            <div id="previewTab" class="markdown" style="margin-top: 0px; display: none;">
                <%-- プレゼンテーション --%>
                <div class="row">
                <span id="presentationArea" class="slideshow"></span>
                </div>
                <div class="row">
                  <div id="preview"></div>
                </div>
            </div>
        </div>
    </div>


