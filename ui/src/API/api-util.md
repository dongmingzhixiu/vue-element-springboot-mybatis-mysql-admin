### getHashCache调用说明
### 需要通过辅助字段 `listId`动态刷新数据。不然数据会有延迟，会在第二次刷新的时候更改
### 如果组件中使用v-for循环绑定数据，需要将:key绑定值做更改，优先使用`listId` 如：`:key='item.listId||item.id'`
```javascript
import api from '../../../API/api.js';
import apiutil from '../../../API/api-util.js';
	
function result(res,chache) {
	if (res.code == -1 || !res.data) {
		return;
	}
	that.menuList = null;
	var ar = res.data.map(function(e) {
		e["icon"] = e["imagePath"]
		e["chche"] =chache;
		e["listId"]=e["id"]+(chache?'_chache':'');
		return e;
	});
	that.menuList = ar;
}
apiutil.getHashCache("getMenu", {
	types: 1
}, res => {
	//console.log("缓存数据", res);
	result(res,false);
}).then(res => {
	//console.log("缓存数据", res);
	result(res,true);
});
```

```javascript
import api from '../../../API/api.js';
import apiutil from '../../../API/api-util.js';
	
getMenu(){
	var that = this;
	function result(res,chache) {
		if (res.code == -1 || !res.data) {
			return;
		}
		that.menuList = null;
		var ar = res.data.map(function(e) {
			e["icon"] = e["imagePath"]
			e["chche"] =chache;
			e["listId"]=e["id"]+(chache?'_chache':'');
			return e;
		});
		that.menuList = ar;
	}
	apiutil.getHashCache("getMenu", {
		types: 2
	}, res => {
		result(res,false);
	}).then(res => {
		result(res,true);
	});
}
```