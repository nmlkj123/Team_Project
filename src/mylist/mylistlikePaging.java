package mylist;

import lombok.Data;

@Data
public class mylistlikePaging {
	private int currentPage;//
	private int pageBlock;//3
	private int pageSize;
	private int totalA;
	private StringBuffer pagingHTML;
	private String subject,content,deptno;
	public void makePagingHTML() {
		pagingHTML=new StringBuffer();
		int totalP=(totalA+pageSize-1)/pageSize;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		if(endPage>totalP)endPage=totalP;
		
		if(startPage>pageBlock)
			pagingHTML.append("<a class='pagingatag' id=paging href='/project_App/member/myPage2.jsp?pg="+(startPage-1)+"'>이전</a>");
		
		for(int i=startPage;i<=endPage;i++) {
			if(i==currentPage) {
				pagingHTML.append("<a class='pagingatag' id=currentPaging href='/project_App/member/myPage2.jsp?pg="+i+"'>"+i+"</a>");
			}else {
				pagingHTML.append("<a class='pagingatag' id=paging href='/project_App/member/myPage2.jsp?pg="+i+"'>"+i+"</a>");
			}
			
			
		}
		
		if(endPage<totalP) {
			pagingHTML.append("<a class='pagingatag' id=paging href='/project_App/member/myPage2.jsp?pg="+(endPage+1)+"'>다음</a>");
		}
	}
	public void makeSearchPagingHTML() {
		pagingHTML=new StringBuffer();
		int totalP=(totalA+pageSize-1)/pageSize;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		
		if(endPage>totalP)endPage=totalP;
		
		if(startPage>pageBlock)
			pagingHTML.append("[<span id=paging onclick=boardSearch("+(startPage-1)+")>����</span>]");
		
		for(int i=startPage;i<=endPage;i++) {
			if(i==currentPage) {
				pagingHTML.append("<span id=paging onclick=boardSearch("+i+")>["+i+"]</span>");
			}else {
				pagingHTML.append("<span id=paging onclick=boardSearch("+i+")>["+i+"]</span>");
			}
			
			
		}
		
		if(endPage<totalP) {
			pagingHTML.append("[<span id=paging onclick=boardSearch("+endPage+1+")>����</span>]");
		}
	}
}
