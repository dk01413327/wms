'use strict'

var getIP = (req)=>{
    var ip = req.headers['x-real-ip'] ||
        req.headers['x-forwarded-for'] ||
        req.socket.remoteAddress || '';
    if(ip.split(',').length>0){
        ip = ip.split(',')[0];
    }
    return ip;
}

var backResult = (response,errcode,errmsg,data,count)=>{
    response.send({errcode:errcode,errmsg:errmsg,data:data,count:count});
}

var createMenu = (data)=>{
    var menu = [];
    for(var i = 0; i < data.length; i++){
        if(data[i].menu_level == 1){
            var child = data.filter(item=>{return item.parent_id==data[i].menu_id});
            menu.push({menu_id:data[i].menu_id,menu_name:data[i].menu_name,menu_icon:data[i].menu_icon,children:child})
        }
    }
    return menu;
}

var parseRowData = data =>{
    data = JSON.stringify(data);
    data = JSON.parse(data);
    return data;
}

var json2Array = (jsonObj)=>{
    var ary = [];
    for(var key in jsonObj){
        ary.push(jsonObj[key])
    }
    return ary;
}

module.exports={
    getIP,
    backResult,
    createMenu,
    json2Array,
    parseRowData
}