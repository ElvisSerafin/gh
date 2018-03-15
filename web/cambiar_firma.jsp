
<%
	String id_regdia	= request.getParameter("id_regdia");
	String firma		= request.getParameter("firma");
	String s_login	= request.getParameter("f_login");
	String s_passwd	= request.getParameter("f_passwd");
	COMANDO = 	"select id_personal " +
					"from datos_personales " +
				"where upper(login)=upper('" + s_login + "') " +
						"and passwd =md5hash(upper('" + s_passwd + "'))";
		//out.print(COMANDO);
		rset=stmt.executeQuery(COMANDO);
	if(rset.next())	
	{		
		HttpSession xsession 	= request.getSession (true);
		xsession.putValue("s_id_personal_user",rset.getString("id_personal"));
		out.print(rset.getString("id_personal"));
		COMANDO = 	"update seguridad_cirugia " +
						"set " +
							"id_"+ firma +" = '" + rset.getString("id_personal") + "'" +
					"where id_regdia='" + id_regdia + "'";
			rset = stmt.executeQuery(COMANDO);
	}
	else
	{
		out.print(0);
	}
%>
