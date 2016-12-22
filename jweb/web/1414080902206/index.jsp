<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head lang="zh-cn">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <title></title>
</head>

<style type="text/css">
    body{
        background: #F0F0F0;
    }
    nav{
        font-family: STXingkai;
        font-size: 17px;
    }
    label {
        font-weight: 100;
    }
    form{
        margin-top: 60px;
    }
</style>
<script>
     $(function() {
            $.datepicker.regional["zh-CN"] = { closeText: "�ر�", prevText: "&#x3c;����", nextText: "����&#x3e;", currentText: "����", monthNames: ["һ��", "����", "����", "����", "����", "����", "����", "����", "����", "ʮ��", "ʮһ��", "ʮ����"], monthNamesShort: ["һ", "��", "��", "��", "��", "��", "��", "��", "��", "ʮ", "ʮһ", "ʮ��"], dayNames: ["������", "����һ", "���ڶ�", "������", "������", "������", "������"], dayNamesShort: ["����", "��һ", "�ܶ�", "����", "����", "����", "����"], dayNamesMin: ["��", "һ", "��", "��", "��", "��", "��"], weekHeader: "��", dateFormat: "yy-mm-dd", firstDay: 1, isRTL: !1, showMonthAfterYear: !0, yearSuffix: "��" }
            $.datepicker.setDefaults($.datepicker.regional["zh-CN"]);
            var datePicker = $("#ctl00_BodyMain_txtDate").datepicker({
                showOtherMonths: true,
                selectOtherMonths: true            
            });
        });
    $( function() {
        $( ".datepicker" ).datepicker();
    } );
</script>

<body>
   <%request.setCharacterEncoding("utf-8");%>
<nav class="navbar navbar-default" role="navigation" >

    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">��Ʊ��Ʊ��������</a>
        </div>
        <ul class="nav navbar-nav">
            <li>
                <a href="#">��ƱԤ��</a>
            </li>
            <li>
                <a href="#">�ҵĶ���</a>
            </li>
            <li>
                <a href="#">������Ϣ</a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
        
        <c:if test="${Passenger.username != null}">
           <li><a href="#"><span class="glyphicon glyphicon-user"></span> ע��</a></li>
           <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">                                                          
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li class="divider"></li>
                    <li><a href="#">δ��ɶ���</a></li>
                    <li><a href="#">����ɶ���</a></li>
                    <li><a href="#">������Ϣ</a></li>
                    <li><a href="#">�˳�</a></li>
                </ul>
            </li>
        </c:if>
        
        <c:if test="${Passenger.username == null}">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> ע��</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> ��¼</a></li>
        </c:if>
        
        </ul>
    </div>
</nav>

<form role="form" class="form-horizontal" action="Check" method="get">

    <div class="form-group">
        <label class="control-label col-md-1">������</label>
        <div class="col-md-2" >
            <input type="text" class="form-control" name="orgin">
        </div>
        <label class="control-label col-md-1">Ŀ�ĵ�</label>
        <div class="col-md-2" >
            <input type="text" class="form-control" name="destination">
        </div>
    </div><br>

    <div class="form-group">
        <label class="control-label col-md-1">������</label>
        <div class="col-md-2">
            <input type="text" class="form-control datepicker" name="departdate">
        </div>
        <label class="control-label col-md-1">������</label>
        <div class="col-md-2">
            <input type="text" class="form-control datepicker" name="returndate">
        </div>
    </div><br>

    <div class="form-group">
        <label  class="control-label col-md-1">����ʱ��</label>
        <div class="col-md-2">
            <select class="form-control" name="starttime">
                <option>00:00-24:00</option>
                <option>00:00-06:00</option>
                <option>06:00-12:00</option>
                <option>12:00-18:00</option>
                <option>18:00-24:00</option>
            </select>
        </div>
    </div><br>

    <div class="form-group">
            <label class="control-label col-md-1">��������</label>
            <label class="control-label col-md-1">
                <input type="checkbox" name="train">GC-����
            </label>
            <label class="control-label col-md-1">
                <input type="checkbox" name="train">D-����
            </label>
            <label class="control-label col-md-1">
                <input type="checkbox" name="train">Z-ֱ��
            </label>
            <label class="control-label col-md-1">
                <input type="checkbox" name="train">T-�ؿ�
            </label>
            <label class="control-label col-md-1">
                <input type="checkbox" name="train">K-����
            </label>
            <label class="control-label col-md-1">
                <input type="checkbox" name="train">����
            </label>
    </div><br>

    <div class="form-group">
        <label class="control-label col-md-1">����ϯ��</label>
        <label class="control-label col-md-1">
            <input type="checkbox" name="seat">������
        </label>
        <label class="control-label col-md-1">
            <input type="checkbox" name="seat">һ����
        </label>
        <label class="control-label col-md-1">
            <input type="checkbox" name="seat">������
        </label>
        <label class="control-label col-md-1">
            <input type="checkbox" name="seat">����
        </label>
    </div><br><br>

    <div class="col-md-1 col-md-offset-3">
        <button type="submit" class="btn btn-success">��ѯ</button>
    </div>
</form>

</body>
<html>