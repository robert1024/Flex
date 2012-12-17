
import mx.collections.ArrayCollection;

	[Bindable]
	private var dp:ArrayCollection = new ArrayCollection();

	[Bindable]
	private var pageData:ArrayCollection = new ArrayCollection();	

	private static const ITEMS_PER_PAGE:int = 20;

	[Bindable]
	private var totalPages:int = 0;
	
	[Bindable]
	private var currentIndex:int = 0;

	private function onCreationComplete():void{
		for(var i:int=0;i<10000;i++){
			dp.addItem({id:i,name:"user_"+i,age:100-i});
		}
		pageInit();
	}

	private function pageInit():void{
		if(null!=dp && dp.length>0){
			totalPages = (dp.length+ITEMS_PER_PAGE-1)/ITEMS_PER_PAGE;
			currentIndex = 0;
			setPage(0);
		}else{
			totalPages = 0;
			currentIndex = 0;
		}
	}

	private function setPage(page:int):void{
		if(page<0 || page>totalPages-1) return;
		currentIndex = page;
		var destIndex:int = page*ITEMS_PER_PAGE;
		pageData.removeAll();
		for(var i:int=0; destIndex<dp.length && i<ITEMS_PER_PAGE;i++,destIndex++){
			pageData.addItem(dp.getItemAt(destIndex));
		}
		pageData.refresh();
		trace(pageData)
	}

	private function goPrePage():void{
		if(currentIndex>0){
			currentIndex -= 1;
			setPage(currentIndex);
		}else{
			return;
		}
	}

	private function goNextPage():void{
		if(currentIndex<totalPages-1){
			currentIndex += 1;
			setPage(currentIndex);
		}else{
			return;
		}
	}