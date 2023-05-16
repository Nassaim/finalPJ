function mkList(post){
	let postUrl = post.bloggerId+"/post/"+post.postNum;
	
	let listDiv0 = document.createElement('div');
	listDiv0.setAttribute("class", "infinite");
	listDiv0.setAttribute("style", "margin-bottom: 20px;");
	
	let listDiv1 = document.createElement('div');
	listDiv1.setAttribute("style", "margin-left: 24px; width: 305px; height: 400px; float: left; padding: 20px; margin-bottom: 10px; ");
	listDiv1.setAttribute("onclick", "location.href="+"\'"+postUrl+"\'");
	listDiv1.setAttribute("class", "card h-100 shadow px-4 px-md-2 px-lg-3 card-span pt-4");
	let listDiv2 = document.createElement('div');
	let thumbnail = document.createElement('img')
	thumbnail.setAttribute("src", post.thumbnail)
	thumbnail.setAttribute("style", "width: 250px; height: 250px; padding-bottom:10px; margin-top: 30px;")
	listDiv2.append(thumbnail);
	
	
	let title = document.createElement('h4');
	title.append(post.postTitle);
	
	
	let listDiv3 = document.createElement('div');
	listDiv3.setAttribute("style", "text-align: right; margin-right: 12px;");
	listDiv3.append(post.postDate);
	
	let contentDiv = document.createElement('div');
	contentDiv.setAttribute("style", "height: 30px; padding: 10px;");
	let content = JSON.parse(post.postContent);
	let datas = checkType(content.blocks)
	console.log("datas", datas);
	if(datas.length == 0){
		contentDiv.append("");
	} else if(datas[0].data.text.length <= 15){
		contentDiv.append(datas[0].data.text);
	} else if(datas[0].data.text.length > 15) {
		contentDiv.append(datas[0].data.text.substr(0, 15)+" ...");
	}
	
	let hr = document.createElement('hr');
	let listDiv4 = document.createElement('div');
	
	let pDIv = document.createElement('div');
	let bloger = document.createElement('p');
	bloger.innerHTML = "by "+post.bloggerId;
	pDIv.append(bloger);
	pDIv.setAttribute("style", "float: left;");
	
	let view = document.createElement('i');
	view.setAttribute("class", "ri-eye-fill");
	view.setAttribute("style", "text-align: right; padding-right:5px;");
	view.innerHTML = post.postView;
	
	let heart = document.createElement('i');
	heart.setAttribute("class", " ri-hearts-fill");
	heart.innerHTML = post.postHeart;
	
	let viewHeart = document.createElement('div');
	viewHeart.append(view, heart);
	viewHeart.setAttribute("style", "float: right;");
	
	listDiv4.append(pDIv, viewHeart);
	
	listDiv1.append(listDiv2, title, listDiv3, contentDiv, hr, listDiv4);
	listDiv0.append(listDiv1);
	
	return listDiv0;
}

function checkType(content){
	let datas = [];
	for (var i in content) {
	   	if(content[i].type == "paragraph"){
	   		datas.push(content[i])
	   	}
	}
	return datas;
}