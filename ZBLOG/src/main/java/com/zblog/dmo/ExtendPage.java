package com.zblog.dmo;

public class ExtendPage {
	
	//页面ID
	private Integer id;
	//页面url
	private String url;
	//扩展页面名称
	private String name;
	//页面内容
	private String pageContent;
	//是否显示
	private Integer display;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPageContent() {
		return pageContent;
	}
	public void setPageContent(String pageContent) {
		this.pageContent = pageContent;
	}
	public Integer getDisplay() {
		return display;
	}
	public void setDisplay(Integer display) {
		this.display = display;
	}
	
}
