<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
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
        margin-top: 180px;
    }
</style>

<body>

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
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> ע��</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> ��¼</a></li>
        </ul>
    </div>
</nav>


<form role="form" class="form-horizontal" method="get" action="check">
    <div class="form-group">
        <label class="control-label col-md-5">�û��� ��</label>
        <div class="col-md-2 has-feedback" >
            <input type="text" name ="Username" class="form-control">
            <span class="glyphicon glyphicon-user form-control-feedback"></span> 
        </div>     
    </div>

    <div class="form-group">
        <label class="control-label col-md-5 ">���� ��</label>
        <div class="col-md-2  has-feedback" >
            <input type="Email" name="Email" class="form-control">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span> 
        </div>     
    </div>


    <div class="form-group">
          <label class="control-label col-md-5">���� ��</label>
          <div class="col-md-2  has-feedback " >
             <input type="Password" name="Password" class="form-control">
             <span class="glyphicon glyphicon-lock form-control-feedback"></span> 
          </div>     
    </div>
    <br>

    <div class="form-group">
      <div class="col-md-5"></div>
      <div class="col-md-2">
        <button type="submit" class="btn btn-success btn-block" id="submit" name="submit">��¼</button>
      </div>
      <div class="col-md-5"></div>
    </div>
    
</form> 
</body>
</html>