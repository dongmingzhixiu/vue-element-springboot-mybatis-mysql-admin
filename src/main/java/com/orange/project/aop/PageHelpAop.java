package com.orange.project.aop;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.orange.project.annotation.MyBatisPageHelper;
import com.orange.project.response.BaseResponse;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.List;

/**
 * describe:  通过注解的方式，进行分页操作
 * author:jpw
 * Date:2020/4/14
 * Time:11:42
 */
@Component
@Aspect
public class PageHelpAop {

	@Autowired
	private ObjectMapper objectMapper;


	@Around("@annotation(com.orange.project.annotation.MyBatisPageHelper)")//带有这个注解的方法，通过代理来执行
	public Object doSetFeildValue(ProceedingJoinPoint pjp) throws Throwable {

		//TODO 1.主体方法只能包含一条查询方法，且返回类型为SQL查询结果类型
		//TODO 2.方法入参必须具备(int currPage)
		//TODO 在执行方法前获取分页参数，并用分页语句包围方法


		//TODO 步骤1：获取方法参数
		// 1、获取目标方法注解参数
		Signature signature = pjp.getSignature();
		MethodSignature methodSignature = (MethodSignature) signature;
		Method targetMethod = methodSignature.getMethod();
		MyBatisPageHelper annotation = targetMethod.getAnnotation(MyBatisPageHelper.class);
		int pageSize = annotation.pageSize();
//		System.out.println(pageSize);
		// 2、获取方法参数
		Parameter[] parameters = targetMethod.getParameters();
		Object[] args2 = pjp.getArgs();
		// 3.获取当前页
		int currPage = 1;
		int index = -1;
		for (int i = 0; i < parameters.length; i++) {
			if (parameters[i].getName().equalsIgnoreCase("currPage")) {
				index = i;
				break;
			}
		}
		currPage = (int) args2[index];
		String returnType=targetMethod.getReturnType().getTypeName();
		if (returnType.equalsIgnoreCase(BaseResponse.class.getTypeName())) {
			//TODO 步骤2：调用分页方法 以环绕的方式实现
			PageHelper.startPage(currPage, pageSize);
			Object ret = pjp.proceed();//执行原方法得到结果
			if (ret instanceof BaseResponse) {
				BaseResponse baseResponse = (BaseResponse) ret;
				PageInfo pageInfo = new PageInfo<List>((List) baseResponse.getData());
				baseResponse.setData(pageInfo);
				return baseResponse;
			}
			return ret;
		} else if (returnType.equalsIgnoreCase(Object.class.getTypeName())){
			PageHelper.startPage(currPage, pageSize);
			Object ret = pjp.proceed();//执行原方法得到结果
			if (ret instanceof List) {
				List list = (List) ret;
				PageInfo pageInfo = new PageInfo<List>(list);
				return pageInfo;
			}
		}
		Object ret = pjp.proceed();//执行原方法得到结果
		return ret;
	}
}
