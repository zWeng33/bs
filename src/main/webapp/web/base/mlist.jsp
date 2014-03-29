<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>首页</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/one-debug.css">
<style type="text/css">
.container {
	margin: 0 auto;
	min-width: 900px;
	max-width: 1360px;
	padding: 15px;
}
#filter-content {
	border-top: 1px solid #ddd;
}
</style>
</head>

<body>
	<div class="ui-nav">
		<ul class="ui-nav-main">
			<li class="ui-nav-item"><a href="#">首&nbsp;&nbsp;页</a></li>
			
			<li class="ui-nav-item ui-nav-item-current"><a href="#">会员管理</a>
				<ul class="ui-nav-submain">
					<li class="ui-nav-subitem"><a href="#">卡类型</a></li>
					<li class="ui-nav-subitem ui-nav-subitem-current"><a href="#">会员资料</a></li>
				</ul>
			</li>
			<li class="ui-nav-item"><a href="#">系统设置</a>
				<ul class="ui-nav-submain">
					<li class="ui-nav-subitem"><a href="#">基础设置</a></li>
					<li class="ui-nav-subitem"><a href="#">用户设置</a></li>
				</ul>
			</li>
			
		</ul>
		<div class="ui-nav-subcontainer"></div>
	</div>
	
	<div class="container">
		<div class="ui-box">
			<form action="m/list" method="get" class="ui-form">
			    <div class="ui-box-content">
					<div class="ui-form-inline">
						<label for="keyword">关键字：</label>
						<input class="ui-input" name="w" id="keyword" value="${foro.keyword }" type="text"/>
					</div>
					<button type="submit" id="search" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-search"></span> 查询</button>	
					<button type="button" id="filter" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-filter"></span> 高级查询</button>
					<!-- <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-download-alt"></span> 导出</button> -->
					<button type="button" id="add" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span> 添加会员</button>
					<button type="button" id="delete" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-remove"></span> 删除会员</button>		
				</div>
				<div id="filter-content" class="ui-box-content fn-hide">
					<div class="ui-grid-row">
						<div class="ui-grid-25">
					    	<div class="ui-form-inline">
								<label for="cardType">卡类型：</label>
								<select id="cardType" name="cardTypeId">
								    <option value="0">请选择</option>
									<option value="1">钻石卡</option>
									<option value="2">铂金卡</option>
								</select>
							</div>
							<div class="ui-form-inline">
								<label for="consumeTimes">消费次数：</label>
								<input class="ui-input" name="startConsumeTimes" id="consumeTimes" type="text"/>
								<span>&nbsp;至&nbsp;</span>
								<input class="ui-input" name="endConsumeTimes" type="text"/>
							</div>
							<div class="ui-form-inline">
								<label for="consumeDate">最后消费：</label>
								<input class="ui-input" name="startConsumeDate" id="consumeDate" type="text"/>
								<span>&nbsp;至&nbsp;</span>
								<input class="ui-input" name="endConsumeDate" type="text"/>
							</div>
						</div>
					</div>
					<div class="ui-grid-row">
					    <div class="ui-grid-25">
					    	<div class="ui-form-inline">
								<label for="sex">性&nbsp;&nbsp;&nbsp;别：</label>
								<select id="sex" name="sex">
									<option value="">请选择</option>
								    <option value="0">女</option>
									<option value="1">男</option>
								</select>
							</div>
							<div class="ui-form-inline">
								<label for="openDate">开卡时间：</label>
								<input class="ui-input" name="startOpenDate" id="openDate" type="text"/>
								<span>&nbsp;至&nbsp;</span>
								<input class="ui-input" name="endOpenDate" type="text"/>
							</div>
							<div class="ui-form-inline">
								<label for="joinDate">注册时间：</label>
								<input class="ui-input" name="startJoinDate" id="joinDate" type="text"/>
								<span>&nbsp;至&nbsp;</span>
								<input class="ui-input" name="endJoinDate" type="text"/>
							</div>
						</div>
					</div>
					<div class="ui-grid-row">
					    <div class="ui-grid-25">
					    	<div class="ui-form-inline">
								<label for="openEmployee">开卡人：</label>
								<select id="openEmployee" name="openEmployeeId">
									<option value="">请选择</option>
								</select>
							</div>
							<div class="ui-form-inline">
								<label for="sumConsumeFee">消费总额：</label>
								<input class="ui-input" name="startSumConsumeFee" id="sumConsumeFee" type="text"/>
								<span>&nbsp;至&nbsp;</span>
								<input class="ui-input" name="endSumConsumeFee" type="text"/>
							</div>
							<div class="ui-form-inline">
								<label for="sumCardFee">储值总额：</label>
								<input class="ui-input" name="startSumCardFee" id="sumCardFee" type="text"/>
								<span>&nbsp;至&nbsp;</span>
								<input class="ui-input" name="endSumCardFee" type="text"/>
							</div>
						</div>
					</div>
					<div class="ui-grid-row">
					    <div class="ui-grid-25">
					    	<div class="ui-form-inline">
								<label for="level">分&nbsp;&nbsp;&nbsp;类：</label>
								<select id="level" name="levelId">
									<option value="">请选择</option>
								</select>
							</div>
							<div class="ui-form-inline">
								<label for="cardFee">储值余额：</label>
								<input class="ui-input" name="startCardFee" id="cardFee" type="text"/>
								<span>&nbsp;至&nbsp;</span>
								<input class="ui-input" name="endCardFee" type="text"/>
							</div>
							<div class="ui-form-inline">
								<label for="presentFee">赠送余额：</label>
								<input class="ui-input" name="startPresentFee" id="presentFee" type="text"/>
								<span>&nbsp;至&nbsp;</span>
								<input class="ui-input" name="endPresentFee" type="text"/>
							</div>
						</div>
					</div>
					<div class="ui-grid-row">
					    <div class="ui-grid-25">
					    	<div class="ui-form-inline">
								<label for="client">客户端：</label>
								<select id="client" name="clientStatus">
									<option value="">请选择</option>
									<option value="0">已绑定</option>
									<option value="1">未绑定</option>
								</select>
							</div>
							<div class="ui-form-inline">
								<label for="birth">生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日：</label>
								<input class="ui-input" name="startBirth" id="birth" type="text"/>
								<span>&nbsp;至&nbsp;</span>
								<input class="ui-input" name="endBirth" type="text"/>
							</div>
							<div class="ui-form-inline">
								<label for="point">积&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分：</label>
								<input class="ui-input" name="startPoint" id="point" type="text"/>
								<span>&nbsp;至&nbsp;</span>
								<input class="ui-input" name="endPoint" type="text"/>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="ui-box">
		    <div class="ui-box-head">
		        <h3 class="ui-box-head-title">查询结果</h3>
		        <span class="ui-box-head-text">共${page.count }个会员。</span>
		        <span class="ui-box-head-more"><span class="glyphicon glyphicon-download-alt"></span> <a href="#">导出查询结果</a></span>
		    </div>
		    
			<table class="ui-table ui-table-inbox">
				<thead>
					<tr>
						<th>#</th>
						<th>姓名</th>
						<th>性别</th>
						<th>手机号</th>
						<th>卡号</th>
						<th>卡类型</th>
						<th>折扣</th>
						<th>卡账户</th>
						<th>注册时间</th>
						<th>最后消费</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${mList }" var="o" varStatus="i">
						<c:choose>
							<c:when test="${fn:length(o.mc_list) > 1 }">
								<tr>
									<td rowspan="${fn:length(o.mc_list) }"><input type="checkbox" /></td>
									<td rowspan="${fn:length(o.mc_list) }"><a href="#">${o.m.name }</a></td>
									<td rowspan="${fn:length(o.mc_list) }">
										<c:choose>
											<c:when test="${o.m.sex == 1 }">男</c:when>
											<c:otherwise>女</c:otherwise>
										</c:choose>
									</td>
									<td rowspan="${fn:length(o.mc_list) }">${o.m.mobile }</td>
									<td class="warning">${o.mc_list[0].cardNo }</td>
									<td class="warning">${o.mc_list[0].cardTypeId }</td>
									<td class="warning">
										[项目:<c:if test="${o.mc_list[0].consumeDiscount == 0 }">无折扣</c:if><c:if test="${o.mc_list[0].consumeDiscount != 0 }"><span class="text-danger">${o.mc_list[0].consumeDiscount }</span>折</c:if>]<br/>
										[卖品:<c:if test="${o.mc_list[0].goodsDiscount == 0 }">无折扣</c:if><c:if test="${o.mc_list[0].goodsDiscount != 0 }"><span class="text-danger">${o.mc_list[0].goodsDiscount }</span>折</c:if>]
									</td>
									<td class="warning">
										[储值余额:<span class="text-danger">${o.mc_list[0].cardFee }</span>元];
										[赠送余额:<span class="text-danger">${o.mc_list[0].presentFee }</span>元]<br/>
										[疗程余额:<span class="text-danger">${o.mc_list[0].treatFee }</span>元];
										[疗程赠送:<span class="text-danger">${o.mc_list[0].treatPresentFee }</span>元]
									</td>
									<td rowspan="${fn:length(o.mc_list) }">${fn:substring(o.m.joinDate,0,10) }</td>
									<td rowspan="${fn:length(o.mc_list) }">${fn:substring(o.m.lastConsumeDate,0,10) }</td>
								</tr>
								<c:forEach items="${o.mc_list }" var="c" begin="1">
									<tr class="warning">
										<td>${c.cardNo }</td>
										<td>${c.cardTypeId }</td>
										<td class="warning">
											[项目:<c:if test="${c.consumeDiscount == 0 }">无折扣</c:if><c:if test="${c.consumeDiscount != 0 }"><span class="text-danger">${c.consumeDiscount }</span>折</c:if>]<br/>
											[卖品:<c:if test="${c.goodsDiscount == 0 }">无折扣</c:if><c:if test="${c.goodsDiscount != 0 }"><span class="text-danger">${c.goodsDiscount }</span>折</c:if>]
										</td>
										<td>
											[储值余额:<span class="text-danger">${c.cardFee }</span>元];
											[赠送余额:<span class="text-danger">${c.presentFee }</span>元]<br/>
											[疗程余额:<span class="text-danger">${c.treatFee }</span>元];
											[疗程赠送:<span class="text-danger">${c.treatPresentFee }</span>元]
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td><input type="checkbox" /></td>
									<td><a href="#">${o.m.name }</a></td>
									<td>
										<c:choose>
											<c:when test="${o.m.sex == 1 }">男</c:when>
											<c:otherwise>女</c:otherwise>
										</c:choose>
									</td>
									<td>${o.m.mobile }</td>
									<c:choose>
										<c:when test="${fn:length(o.mc_list) > 0 }">
											<td class="warning">${o.mc_list[0].cardNo }</td>
											<td class="warning">${o.mc_list[0].cardTypeId }</td>
											<td class="warning">
												[项目:<c:if test="${o.mc_list[0].consumeDiscount == 0 }">无折扣</c:if><c:if test="${o.mc_list[0].consumeDiscount != 0 }"><span class="text-danger">${o.mc_list[0].consumeDiscount }</span>折</c:if>]<br/>
												[卖品:<c:if test="${o.mc_list[0].goodsDiscount == 0 }">无折扣</c:if><c:if test="${o.mc_list[0].goodsDiscount != 0 }"><span class="text-danger">${o.mc_list[0].goodsDiscount }</span>折</c:if>]
											</td>
											<td class="warning">
												[储值余额:<span class="text-danger">${o.mc_list[0].cardFee }</span>元];
												[赠送余额:<span class="text-danger">${o.mc_list[0].presentFee }</span>元]<br/>
												[疗程余额:<span class="text-danger">${o.mc_list[0].treatFee }</span>元];
												[疗程赠送:<span class="text-danger">${o.mc_list[0].treatPresentFee }</span>元]
											</td>
										</c:when>
										<c:otherwise>
											<td colspan="4" class="warning">
												<span class="text-danger">无会员卡 <a href="#">[开卡]</a></span>
											</td>
										</c:otherwise>
									</c:choose>
									<td>${fn:substring(o.m.joinDate,0,10) }</td>
									<td>${fn:substring(o.m.lastConsumeDate,0,10) }</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
				<tr>
					<td colspan="10">
						<jsp:include page="../comm/page.jsp"></jsp:include>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script charset="utf-8" id="seajsnode"src="http://static.alipayobjects.com/seajs/??seajs/2.1.1/sea.js,seajs-combo/1.0.0/seajs-combo.js,seajs-style/1.0.0/seajs-style.js"></script>
	<script type="text/javascript">
		seajs.config({
			alias : {
				'$' : 'gallery/jquery/1.7.2/jquery',
				'confirmbox' : 'arale/dialog/1.2.6/confirmbox',
				'dialog' : 'arale/dialog/1.2.6/dialog',
				'select' : 'arale/select/0.9.9/select'
			}
		});
		seajs.use('arale/dialog/1.2.6/dialog.css');
		seajs.use(['dialog', 'select', '$'], function(Dialog, Select, $) {
			var o = new Dialog({
				trigger : '#add',
				width : '500px',
				initialHeight : '435px',
				effect : 'fade',
				content : './web/base/addm.jsp'
			});
			
			// Select
	    	/*new Select({
			    trigger: '#cardType'
			}).render();
	    	new Select({
			    trigger: '#sex'
			}).render();
	    	new Select({
			    trigger: '#openEmployee'
			}).render();
	    	new Select({
			    trigger: '#level'
			}).render();
	    	new Select({
			    trigger: '#client'
			}).render();*/
	    	
	    	$('#filter').on('click', function(){
	    		$(this).toggleClass('active');
	    		$('#filter-content').slideToggle();
	    	});
		});
		seajs.use('confirmbox', function(Confirmbox) {
			//Confirmbox.alert('xxx');
		});
	</script>
</body>
</html>
