package com.blog.util.callback;

/**
 * @ClassName: Callback 
 * @Description: 回调接口 
 * @作者 snowalker
 * @时间 2016年11月10日 上午9:54:10 
 * 
 * @param <T>
 */
public interface ICallback<T, E> {
	
	public T doCallback(E e);
}
