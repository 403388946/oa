<%--
  Created by IntelliJ IDEA.
  User: 46637
  Date: 2016/8/15
  Time: 0:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script src="${ctx}/static/js/agreementInfo/agreementInfoAdd.js"></script>
<style>
    .datetimepicker{
        border-radius: 4px;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
        color: #555;
        border: 1px solid #ccc;
        height: 34px;
        line-height: 1.42857;
        padding: 6px 12px;
        font-size: 13px;
    }
</style>
<script type="text/javascript" >
    var ctx_ = "${ctx}";
</script>
<div class="main-box">
    <header class="main-box-header clearfix">
        <h2>新增合同信息</h2>
    </header>
    <div class="main-box-body clearfix">
        <c:choose>
            <c:when test="${not empty agreementInfo.id}">
                <form action="${ctx}/agreementInfo/updateSave" id="editFoem" role="form" class="form-horizontal">
            </c:when>
            <c:otherwise>
                <form action="${ctx}/agreementInfo/save" id="editFoem" role="form" class="form-horizontal">
            </c:otherwise>
        </c:choose>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="selectEmployee">选择员工：</label>
            <div class="col-lg-7">
                <input type="hidden" id="id" name="id" class="form-control" value="${agreementInfo.id}">
                <input type="hidden" id="employeeId" name="employeeId" class="form-control" value="${agreementInfo.employeeId}">
                <input type="text" value="${agreementInfo.employeeName}" id="selectEmployee"  class="btn btn-default" data-toggle="modal" data-target="#employee_modal" name="customer" placeholder="请选择员工" readonly="readonly">
            </div>
        </div>
        <br>

        <div class="form-group">
            <label class="col-lg-2 control-label" for="employeeCode_text">员工编号：</label>
            <div class="col-lg-7" id="employeeCode_text">
                ${agreementInfo.employeeCode}
            </div>
        </div>
        <br>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="idCard_text">身份证号：</label>
            <div class="col-lg-7" id="idCard_text">
                ${agreementInfo.idCard}
            </div>
        </div>
        <br>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="customerCode_text">客户编号：</label>
            <div class="col-lg-7" id="customerCode_text">
                ${agreementInfo.customerCode}
            </div>
        </div><br>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="customerName_text">客户姓名：</label>
            <div class="col-lg-7" id="customerName_text">
                ${agreementInfo.customerName}
            </div>
        </div>
        <br>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="customPriceNum_text">客户报价单号：</label>
            <div class="col-lg-7" id="customPriceNum_text">
                ${agreementInfo.customerPriceNum}
            </div>
        </div>
        <br>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="employmentForm_text">用工形式：</label>
            <div class="col-lg-7" id="employmentForm_text">
                <c:if test="${agreementInfo.employmentForm == '1'}">代理</c:if>
                <c:if test="${agreementInfo.employmentForm == '2'}">派遣</c:if>
            </div>
        </div>
        <br>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="agreementStartTime">劳动合同起止时间：</label>
            <div class="col-sm-7 input-group">
                <input type="text" placeholder="请选择合同开始日期" id="agreementStartTime" name="agreementStartTime" class="datetimepicker" value="${agreementInfo.agreementStartTimeStr}" readonly="readonly">
                ~
                <input type="text" placeholder="请选择合同结束日期" id="agreementEndTime" name="agreementEndTime" class="datetimepicker" value="${agreementInfo.agreementEndTimeStr}" readonly="readonly">
                <h6><font color="#808080">注意：劳动合同开始时间必须小于截止时间, 劳动合同开始时间必须小于试用期开始时间，劳动合同的截止时间必须大于试用期结束时间</font></h6>
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="testStartTime">试用期起止时间：</label>
            <div class="col-lg-7 input-group">
                <input type="text" placeholder="请选择试用期开始日期" id="testStartTime" name="testStartTime" class="datetimepicker" value="${agreementInfo.testStartTimeStr}" readonly="readonly">
                ~
                <input type="text" placeholder="请选择试用期结束日期" id="testEndTime" name="testEndTime" class="datetimepicker" value="${agreementInfo.testEndTimeStr}" readonly="readonly">
                <h6><font color="#808080">注意：试用期开始时间必须小于截止时间，试用期开始时间必须大于劳动合同的开始时间，试用期的结束时间必须小于劳动合同的截止时间</font></h6>
            </div>
        </div>
        <br>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="testSalary">试用期工资：</label>
            <div class="col-lg-7">
                <input type="text" placeholder="请输入试用期工资" id="testSalary" name="testSalary" class="form-control" value="${agreementInfo.testSalary}">
            </div>
        </div>
        <br>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="formalSalary">正式工资：</label>
            <div class="col-lg-7">
                <input type="text" placeholder="请输入正式工资" id="formalSalary" name="formalSalary" class="form-control" value="${agreementInfo.formalSalary}">
            </div>
        </div>
        <br>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="agreementVersion">劳动合同版本：</label>
            <div class="col-lg-7">
                <input type="text" placeholder="请输入劳动合同版本" id="agreementVersion" name="agreementVersion" class="form-control" value="${agreementInfo.agreementVersion}">
            </div>
        </div>
        <br>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="serviceStatus">劳动合同期限：</label>
            <div class="col-lg-7">
                <select id="serviceStatus" name="term" class="form-control">
                    <option value="">--请选择--</option>
                    <option value="0" <c:if test="${agreementInfo.term == 0}">selected</c:if>>无固定期限</option>
                    <option value="1" <c:if test="${agreementInfo.term == 1}">selected</c:if>>1 年</option>
                    <option value="2" <c:if test="${agreementInfo.term == 2}">selected</c:if>>2 年</option>
                    <option value="3" <c:if test="${agreementInfo.term == 3}">selected</c:if>>3 年</option>
                    <option value="4" <c:if test="${agreementInfo.term == 4}">selected</c:if>>4 年</option>
                    <option value="5" <c:if test="${agreementInfo.term == 5}">selected</c:if>>5 年</option>
                    <option value="6" <c:if test="${agreementInfo.term == 6}">selected</c:if>>6 年</option>
                    <option value="7" <c:if test="${agreementInfo.term == 7}">selected</c:if>>7 年</option>
                    <option value="8" <c:if test="${agreementInfo.term == 8}">selected</c:if>>8 年</option>
                    <option value="9" <c:if test="${agreementInfo.term == 9}">selected</c:if>>9 年</option>
                    <option value="10" <c:if test="${agreementInfo.term == 10}">selected</c:if>>10 年</option>
                </select>
            </div>
        </div>
        <br>

        <div class="modal-footer" style="text-align: left;">
            <button class="btn btn-success" type="submit">保存</button>
            <button class="btn btn-cancel" type="reset">取消</button>
        </div>
    </form>
    </div>
</div>

<div class="modal fade bs-example-modal-lg" id="employee_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">选择员工信息</h4>
            </div>
            <div id="employee_div" class="modal-body" >
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="employee_select" >确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

