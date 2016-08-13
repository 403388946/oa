<%--
  Created by IntelliJ IDEA.
  User: 46637
  Date: 2016/8/11
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script src="${ctx}/static/js/agreement/agreementList.js"></script>
<div id="agreement-toolbar">
    <div class="form-inline" role="form" id="search_div_agreement">
        <div class="form-group">
            报价单号：<input type="text" class="form-control" id="customerPriceNum" name="customerPriceNum" placeholder="请输入报价单号" />
        </div>
        <div class="form-group">
            客户名称：<input type="text" name="customerName" id="customerName" class="form-control" placeholder="请输入客户名称" />
        </div>
        <div class="form-group">
            客户编号:<input type="text" id="customerCode" name="customerCode" class="form-control" placeholder="输入客户编号" />
        </div>
        <button type="button" id="g_search" class="btn btn-default ">
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            查询
        </button>
        <button type="button" id="g_reset" class="btn btn-default ">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            清空查询
        </button>
        <button type="button" id="g_add" class="btn btn-default ">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            添加报价单号信息
        </button>
    </div>
</div>
<table id="agreement_table" class="table table-bordered">
</table>

<div class="modal fade bs-example-modal-lg" id="agreement_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form action="${ctx}/agreement/saveAdd" id="editFoem" role="form" class="form-horizontal">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabe1">添加报价单号信息</h4>
                </div>
                <div id="agreement_modal_body" class="modal-body" >
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="priceNum">报价单号：</label>
                        <div class="col-lg-9">
                            <input type="text" placeholder="请输入报价单号" id="priceNum" name="priceNum" class="form-control" value="">
                            <input type="hidden" id="id" name="id" class="form-control" value="">
                        </div>
                    </div>
                    <br>

                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="salary">薪资：</label>
                        <div class="col-lg-9">
                            <input type="number" placeholder="请输入薪资" id="salary" name="salary" class="form-control" value="">
                        </div>
                    </div>
                    <br>

                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="customerName_">选择客户：</label>
                        <div class="col-lg-9">
                            <input type="text" placeholder="请选择客户" id="customerName_" name="customerName_" class="form-control" value="" readonly="readonly">
                            <input type="hidden" id="customId" name="customId" class="form-control" value="">
                        </div>
                    </div>
                    <br>

                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="customerCode_">客户编号：</label>
                        <div class="col-lg-9" id="customerCode_">
                        </div>
                    </div>
                    <br>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="save_btn" >确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade bs-example-modal-lg" id="customer-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabe2">选择客户</h4>
            </div>
            <div id="customer_div" class="modal-body" >
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="customer-select" >确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>