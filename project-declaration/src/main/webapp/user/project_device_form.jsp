<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<script>
    function gooo(id){
        if(id!=""){
            location.href='?x='+id;
        }
    }
    $(function () {


    })
function applyd(){
	var f=document.formd;

    if(f.device_name.value==""){
        alert('名称不能为空');
        return false;
    }

	if(f.count.value==""){
		alert('采购物数量不能为空');
		return false;
	}
    if(f.source.value==""){
        alert('采购物来源不能为空');
        return false;
    }
    if(f.plan_expenditure.value==""){
        alert('计划经费不能为空');
        return false;
    }
    if(f.total_payment.value==""){
        alert('实际采购费不能为空');
        return false;
    }
    if(f.arrival_time.value==""){
        alert('实际采购费不能为空');
        return false;
    }
    if(f.project_id.value==""){
        alert('请选择项目');
        return false;
    }
    alert("请确认？")

}
</script>
</head>

<body>

      <%--个人信息--%>
      <table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#AEDEF4">
        <tr>
          <td height="25" colspan="8" align="center" bgcolor="#FFF9DF">申报者--基本信息</td>
        </tr>
        <tr>
          <td height="25" align="center" bgcolor="#FFF9DF">姓名</td>
          <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
            <div align="left"><input type="text" size="50" disabled="disabled" value="${sessionScope.user.name}"/></div></td>
          <td align="left" bgcolor="#FFF9DF" class="t5"><div align="center">手机号</div></td>
          <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
            <div align="left">
              <input type="text" size="50" disabled="disabled" value="${sessionScope.user.mobile}"/>
            </div></td>
          </td>
        </tr>
        <tr>
          <td height="25" align="center" bgcolor="#FFF9DF">年龄</td>
          <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
            <div align="left">
             <input type="text" size="50" disabled="disabled" value="${sessionScope.user.age}"/>
            </div>
           </td>
          <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">年级</div></td>
          <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
            <div align="left">
              <input type="text" size="50" disabled="disabled" value="${sessionScope.user.level}"/>
            </div>
        </tr>
        <tr>
          <td height="25" align="center" bgcolor="#FFF9DF">院系</td>
          <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
            <div align="left">
              <input type="text" size="50" disabled="disabled" value="${sessionScope.user.department}"/>
            </div>
          </td>
          <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">专业</div></td>
          <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
            <div align="left">
              <input type="text" size="50" disabled="disabled" value="${sessionScope.user.major}"/>
            </div>
        </tr>
        <tr>
          <td width="10%" height="25" align="center" bgcolor="#FFF9DF">指导老师</td>
          <td align="center" bgcolor="#FFFFFF" class="t5">
            <div align="left">
              <input type="text"size="20" disabled="disabled" value="${sessionScope.user.teacher.name}"/>
            </div></td>
          <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">职务</div></td>
          <td align="center" bgcolor="#FFFFFF" class="t5"><div align="left">
              <input type="text"size="20" disabled="disabled" value="${sessionScope.user.teacher.job}"/>
          </div></td>
          <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">电话</div></td>
          <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
            <div align="left">
                <input type="text"size="20" disabled="disabled" value="${sessionScope.user.teacher.mobile}"/>
            </div></td>
        </tr>
      </table>

      <%--设备信息--%>
        <form action="${pageContext.request.contextPath}/purchase/addTheDevice.do" method="post" name="formd" id="formd" onsubmit="return applyd();">
            <table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#AEDEF4">
                <tr>
                    <td height="25" colspan="8" align="center" bgcolor="#FFF9DF">项目采购条目--基本信息</td>
                </tr>
                <tr>
                    <td height="25" align="center" bgcolor="#FFF9DF">采购物</td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input name="device_name" type="text" id="device_name" size="30" />（设备名/材料名等）
                        </div></td>
                    <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">型号</div></td>
                    <td align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="6" name="model" id="model"/>(无则不填)
                        </div></td>
                    <td height="25" align="center" bgcolor="#FFF9DF">数量</td>
                    <td align="center" bgcolor="#FFFFFF" class="t5"><div align="left">
                        <input name="count" type="text" id="count" oninput="value=value.replace(/[^\d]/g,'')" size="6" />
                    </div>
                </tr>

                <tr>
                    <td height="25" align="center" bgcolor="#FFF9DF">采购物来源</td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5"><div align="left">
                        <input name="source" type="text" id="source" size="40" />
                    </div>
                    </td>
                    <td height="25" align="center" bgcolor="#FFF9DF">计划支出</td>
                    <td align="center" bgcolor="#FFFFFF" class="t5"><div align="left">
                        <input name="plan_expenditure" type="text" id="plan_expenditure" size="6" oninput="value=value.replace(/[^\d]/g,'')" />（万）
                    </div>
                    </td>
                    <td height="25" align="center" bgcolor="#FFF9DF">实际支出</td>
                    <td  align="center" bgcolor="#FFFFFF" class="t5"><div align="left">
                        <input name="total_payment" type="text" id="total_payment" size="6" oninput="value=value.replace(/[^\d]/g,'')" />（万）
                    </div>
                    </td>

                </tr>
                <tr>
                    <td width="10%" height="25" align="center" bgcolor="#FFF9DF">采购日期</td>
                    <td align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input value="当天日期" type="text" size="20" disabled="disabled"/>
                        </div></td>
                    <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">验收时间</div></td>
                    <td align="center" bgcolor="#FFFFFF" class="t5"><div align="left">
                        <input  type="text"<%-- id="arrival_time" name="arrival_time"--%> disabled="disabled" value="管理员验证" size="20"/>
                    </div></td>
                    <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">管理员验收</div></td>
                    <td align="center" colspan="3" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="20" disabled="disabled" value="未验收" />
                        </div></td>
                </tr>
                <tr>
                    <td height="25" align="center" bgcolor="#FFF9DF">选择项目</td>
                    <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <select name="project_id" id="project_id" style="width:200px;">
                                <option value="">请选择...</option>
                                <c:forEach items="${sessionScope.userPassProjects}" var="project">
                                    <option value="${project.id}">${project.id}-${project.name}</option>
                                </c:forEach>
                            </select>(提交后不可修改)</div></td>
                    <td align="left" bgcolor="#FFF9DF" class="t5"><div align="center">经费来源</div></td>
                    <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
                        <select name="applyyear" id="applyyear" style="width:130px;">
                            <option value="" >申请校方供给</option></select>（目前只支持校方审批经费）</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#FFF9DF">&nbsp;</td>
                    <td height="25" colspan="7" align="left" bgcolor="#FFFFFF"  style="color:#999999; padding-left:20px;"><input type="submit" name="Submit" value="确认提交" size="20"/></td>
                </tr>
            </table>
        </form>

</body>
</html>
