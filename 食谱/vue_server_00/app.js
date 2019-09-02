//vue_server_00/app.js node程序
//1:加载第三方模块
//web服务器
const express = require("express");
//mysql驱动
const mysql = require("mysql");
//跨域
const cors = require("cors");
//session
const session = require("express-session");

//2:配置数据库连接池:提高数据效率
var pool = mysql.createPool({
   host:"127.0.0.1",  //数据库地址
   user:"root",       //数据库用户名
   password:"",       //数据库密码
   port:3306,         //数据库端口
   database:"sc",     //数据库名称
   connectionLimit:15 //连接数量
});

var server = express();
//3:配置跨域模块 50
server.use(cors({
//   //允许跨域访问程序地址列表
   origin:["http://127.0.0.1:8080",
   "http://localhost:8080"],
   credentials:true //请求验证
}))
//4:配置session模块
server.use(session({
 secret:"128位字符串",  //安全字符串
 resave:true,          //请求时更新数据
 saveUninitialized:true//保存初始数据
}));
//4.1:配置项目静态目录
server.use(express.static("public"));
//http://127.0.0.1:3000/01.jpg
//5:启动监听3000
server.listen(3000);


//登录
server.get("/sc_login",(req,res)=>{
  var uname=req.query.uname;
  var upwd=req.query.upwd;
  var sql="SELECT * FROM sc_user WHERE uname=? AND upwd=md5(?)";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"用户名或密码错误"});
    }else{
      req.session.uid=result[0].uid;
      req.session.uname=result[0].uname;
      req.session.upic=result[0].upic;
      res.send({code:1,msg:"登录成功"})
    }
  })
});
//功能一:完成用户登录操作
server.get("/reg",(req,res)=>{
  //1:参数:获取网页传递两个数据 uname upwd
  //参数方式一:?uname=tom&upwd=123 查询字符串
  //参数方式二:/tom/123            参数
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  var user_name=req.query.user_name;
  //2:sql:查询sql语句
  //数据库 库名 表名 列名 小写字母
  var sql = "INSERT INTO sc_user values(NULL,?,md5(?),'zuo.jpg',?)";
  //3:json:{code:1,msg:"注册成功"}
  pool.query(sql,[uname,upwd,user_name],(err,result)=>{
     //执行sql语句回调函数
     if(err)throw err;
     //判断
     if(result.length==0){
   res.send({code:-1,msg:"用户名或密码有误"});
     }else{
   res.send({code:1,msg:"注册成功"})    
     }
  })
});

server.get("/indexTop",(req,res)=>{
  var sql="SELECT * FROM sc_index_top"
  pool.query(sql,[],(err,result)=>{
    if(err)throw err;
    res.send(result);
  })
})

server.get("/indexBom",(req,res)=>{
  var sql="SELECT * FROM sc_tuijian_top";
  pool.query(sql,[],(err,result)=>{
    if(err)throw err;
    res.send(result);
  })
})

server.get("/userList",(req,res)=>{
  var sql="SELECT * FROM sc_user";
  pool.query(sql,[],(err,result)=>{
    if(err)throw err;
      res.send(result);
  })
})

//功能:完成用户查询操作
server.get("/sc_Check",(req,res)=>{
  //1:参数:获取网页传递两个数据 uname upwd
  //参数方式一:?uname=tom&upwd=123 查询字符串
  //参数方式二:/tom/123            参数
  var lname = req.query.lname;
 console.log("------>"+lname);
  //2:sql:查询sql语句
  //数据库 库名 表名 列名 小写字母
// var l=[`%+${lname}+%`];
  var sql = "SELECT * FROM sc_list WHERE lname LIKE ? ";
  //3:json:{code:1,msg:"登录成功"}
  let param = ["%"+lname+"%"];
  pool.query(sql,param,(err,result)=>{
   //执行sql语句回调函数
   if(err)throw err;
   console.log(result);
   if(result.length==0){
   res.send({code:-1,msg:"查询失误"});
   }else{
   //2:将成功消息发送脚手架  
   res.send({code:1,msg:"查询成功",data:result})  
   }
  })
});

// 收藏食谱
server.get("/col",(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请先登录"});
    return;
  }else{
  var lname=req.query.lname;
  var limg=req.query.limg;
  sql=`INSERT INTO sc_collect VALUES(null,'${limg}',"${lname}",${uid})`
  pool.query(sql,(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"添加成功"})
      })
    }
  })
  

//收藏查询
  server.get("/collect",(req,res)=>{
    var uid=req.session.uid;
    var sql="SELECT * FROM sc_collect where uid=?";
    pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    res.send(result);
    })
    })

    server.get("/ress",(req,res)=>{
      req.session.destroy();
      res.send({code:1,msg:"ok"});
    })
//问题查询
    server.get("/question",(req,res)=>{
      var sql="select * from sc_que";
      pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send(result);
      });
    })
//添加问题
    server.get("/addque",(req,res)=>{
      var uid=req.session.uid;
      var intque=req.query.intque;
      var add=req.query.add;
      var sql="INSERT INTO sc_que VALUES(NULL,?,?,?)";
      pool.query(sql,[intque,add,uid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
          res.send({code:1,msg:"提问成功"});
        }else{
          res.send({code:-1,msg:"提问失败"});
        }
      })
    })

    server.get("/getque",(req,res)=>{
        var id=req.query.id;
        var sql="SELECT * FROM sc_que where qid=?";
        pool.query(sql,[id],(err,result)=>{
          if(err)throw err;
          res.send(result);
        })
    })
//添加答案
  server.get("/addans",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
      res.send({code:-2,msg:"请先登录"});
      return;
    }
    var upic=req.session.upic;
    var uname=req.session.uname;
    var answer=req.query.area;
    var pid=req.query.pid;
    var sql="INSERT INTO sc_ans VALUES(NULL,?,?,?,now(),?,?)"
    pool.query(sql,[answer,upic,uname,uid,pid],(err,result)=>{
      if(err)throw err;
      if(result.affectedRows>0){
        res.send({code:1,msg:"添加成功"});
      }else{
        res.send({code:-1,msg:"添加失败"});
      }
    })
  })

//查询答案
  server.get("/selans",(req,res)=>{
    var qid=req.query.qid;
    var sql="SELECT * FROM sc_ans where qid=?";
    pool.query(sql,[qid],(err,result)=>{
      if(err)throw err;
      res.send(result);
    })
  })
//推荐页-详情跳转
server.get("/sc_detail",(req,res)=>{
  //1:参数:获取网页传递数据 tid
    var tid=req.query.tid;
    var sql="SELECT * FROM sc_tuijian_det WHERE tid=?";
    pool.query(sql,[tid],(err,result)=>{
      if(err) throw err;
      res.send(result);
      
    })
})
//我的问题查询
server.get("/myque",(req,res)=>{
  var uid=req.session.uid;
  var sql="select * from sc_que where uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    res.send(result);
  });
})

//我的答案查询
server.get("/myans",(req,res)=>{
  var uid=req.session.uid;
  var sql="select question,answer from sc_que left join sc_ans on sc_que.qid=sc_ans.qid where sc_ans.uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    res.send(result);
  })
})

//详情页收藏食谱
server.get("/addcol",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
      res.send({code:-2,msg:"请先登录"});
      return;
    }
    var img=req.query.img;
    var name=req.query.name;
    var sql="INSERT INTO sc_collect VALUES(NULL,?,?,?)";
    pool.query(sql,[img,name,uid],(err,result)=>{
      if(err)throw err;
      if(result.affectedRows>0){
        res.send({code:1,msg:"添加成功"});
      }else{
        res.send({code:-1,msg:"添加失败"});
      }
    })
})

server.get("/getCap",(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请先登录"});
    return;
  }
  var sql="SELECT * FROM sc_user WHERE uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    res.send(result);
    })
})
