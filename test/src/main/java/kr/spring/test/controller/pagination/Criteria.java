package kr.spring.test.controller.pagination;

public class Criteria {

		private int page;
		private int contentNum;
		private String type;
		private String search;
		public Criteria() {
			this.page = 1;
			this.contentNum = 5;
			this.type = "all";
			this.search = "";
		}
		public int getPage() {
			return page;
		}
		public void setPage(int page) {
			if(page < 0)
				this.page = 1;
			else
				this.page = page;
		}
		public int getContentNum() {
			return contentNum;
		}
		public void setContentNum(int contentNum) {
			if(contentNum < 1)
				this.contentNum = 1;
			this.contentNum = contentNum;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getSearch() {
			return search;
		}
		public void setSearch(String search) {
			this.search = search;
		}
		@Override
		public String toString() {
			return "Criteria [page=" + page + ", contentNum=" + contentNum + ", type=" + type + ", search=" + search
					+ "]";
		}
		public int getPageStart() {
			return (this.page -1) * contentNum;
		}
}
