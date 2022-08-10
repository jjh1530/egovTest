package egovframework.example.test.vo;

public class Pagination {
	
	private int listSize = 10; //초기값
	
	private int listSize2 = 10; //초기값
	
	private int rangeSize = 10; //초기값 페이지 개수
	
	private int page; 
	
	private int range;
	
	private int listCnt;
	
	private int pageCnt;
	
	private int startPage;
	
	private int startList;
	
	private int endPage;
	
	private boolean prev;
	
	private boolean next;

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	
	
	public int getListSize2() {
		return listSize2;
	}

	public void setListSize2(int listSize2) {
		this.listSize2 = listSize2;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		this.pageCnt = (int)Math.ceil(listCnt/listSize) +1;
		this.startPage = (range-1) * rangeSize +1;
		this.endPage = range * rangeSize;
		this.startList = (page-1) * listSize;
		this.prev = range ==1 ? false: true;
		this.next = endPage > pageCnt? false: true;
		
		if(this.endPage >this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
		
	}
	
	public void pageInfo2(int page, int range, int listCnt) { 
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		this.pageCnt = (int)Math.ceil(listCnt/listSize2)+1;
		this.startPage = (range-1) * rangeSize +1;
		this.endPage = range * rangeSize;
		this.startList = (page-1) * listSize2;
		this.prev = range ==1 ? false: true;
		this.next = endPage > pageCnt? false: true;
		
		if(this.endPage >this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
		
	}

}
