SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS sc;
#创建数据库,设置存储的编码
CREATE DATABASE sc CHARSET=UTF8;
#进入数据库
USE sc;
/**用户信息**/
CREATE TABLE sc_user(
   uid INT PRIMARY KEY AUTO_INCREMENT, #用户ID
   uname VARCHAR(32),                  #用户名
   upwd VARCHAR(32),		       #用户密码
   upic VARCHAR(64),		       #用户头像	
   user_name VARCHAR(32)	       #网名
);

/**首页**/
CREATE TABLE sc_index_top( 
   uid INT PRIMARY KEY AUTO_INCREMENT, #ID
   img VARCHAR(128),		       #图片路径
   title VARCHAR(16),                  #标题
   details VARCHAR(32)		       #详情
);

/**推荐**/
CREATE TABLE sc_tuijian_top( 
   uid INT PRIMARY KEY AUTO_INCREMENT, #ID
   img VARCHAR(128),		       #图片路径
   title VARCHAR(16),                  #标题
   points  INT,                        #评分
   look INT			       #浏览
);
/**收藏表**/
CREATE TABLE sc_collect( 
   cid INT PRIMARY KEY AUTO_INCREMENT, #ID
   img VARCHAR(128),		       #图片路径
   title VARCHAR(16),		       #标题
   uid INT	
);


/**主页今日餐次表**/
CREATE TABLE sc_meal(
   mid INT PRIMARY KEY AUTO_INCREMENT, #ID
   mpic VARCHAR(64),                   #图片
   mtitle VARCHAR(32),		       #标题
   mdetial VARCHAR(32)	               #详情
);


/**商品推荐表**/
CREATE TABLE sc_groom(
   gid INT PRIMARY KEY AUTO_INCREMENT, #用户ID
   gpic VARCHAR(64),                   #用户名
   gtitle VARCHAR(32),                 #标题
   glike INT                           #喜欢
);


/**菜谱大全分类表**/
CREATE TABLE sc_type(
   tid INT PRIMARY KEY AUTO_INCREMENT, #类别ID
   tname VARCHAR(32)                   #类别名称
);


/**菜谱大全二级分类**/
CREATE TABLE sc_sec_type(
   sid INT PRIMARY KEY AUTO_INCREMENT, #二级类别ID
   sname VARCHAR(32),                  #二级类别名称
   tid INT,			       #类别ID
   FOREIGN KEY(tid) REFERENCES sc_type(tid)  #用外键连接分类表
);


/**菜谱大全商品列表**/
CREATE TABLE sc_list(
   lid INT PRIMARY KEY AUTO_INCREMENT,  #商品列表ID
   limg  VARCHAR(64),                   #商品列表图片
   lname VARCHAR(32),                   #商品列表名称
   sid INT,                             #二级类别ID 
   FOREIGN KEY(sid) REFERENCES sc_sec_type(sid)  #用外键连接分类二级表
);


/**菜谱大全商品详情表**/
CREATE TABLE sc_pro(
   pid INT PRIMARY KEY AUTO_INCREMENT, #商品ID
   ptitle VARCHAR(32),                 #商品标题
   pimg VARCHAR(64),                   #商品图片
   pmaterial VARCHAR(128),             #商品材料
   pstep VARCHAR(2000),                #商品步骤
   lid INT,			       #列表id
   FOREIGN KEY(lid) REFERENCES sc_list(lid)  #用外键连接列表
);

/**家常菜谱分类表**/
CREATE TABLE sc_cip(
   cid INT PRIMARY KEY AUTO_INCREMENT, #类别ID
   ctitle VARCHAR(32)                #类别名称
);

/**家常菜谱二级分类**/
CREATE TABLE sc_sec_cip(
   did INT PRIMARY KEY AUTO_INCREMENT, #二级类别ID
   cname VARCHAR(32),                  #二级类别名称
   cid INT,			       #类别ID
   FOREIGN KEY(cid) REFERENCES sc_cip(cid)  #用外键连接分类表
);
/**问题表**/
CREATE TABLE sc_que(
   qid INT PRIMARY KEY AUTO_INCREMENT, #问题ID
   question  VARCHAR(256),             #问题
   uid INT                             #用户id
);
/**答案表**/
CREATE TABLE sc_ans(
   aid INT PRIMARY KEY AUTO_INCREMENT, #问题ID
   answer  VARCHAR(256),               #回答
   uimg    VARCHAR(64),                #用户图片
   uname   VARCHAR(32),                #用户名称
   uid INT,                            #用户id
   qid INT			       #问题id
);

Insert into sc_user values(NULL,"admin",md5("123456"),"zuozhe.jpg","张三");
Insert into sc_user values(NULL,"txk",md5("123456"),"txk.jpg","田小康");
Insert into sc_user values(NULL,"zlb",md5("123456"),"zlb.jpg","支林彬");
Insert into sc_user values(NULL,"wjj",md5("123456"),"wjj.png","王俊杰");
Insert into sc_user values(NULL,"wjj",md5("123456"),"zuozhe.jpg","宋丹峰");

/**推荐详情表**/
CREATE TABLE sc_tuijian_det( 
   tid INT PRIMARY KEY AUTO_INCREMENT, #ID
   title VARCHAR(80),                  #标题
   timg VARCHAR(128),		            #图片路径
   stitle1  VARCHAR(12),               #小标题
   foods  VARCHAR(200),                 #食材
   stitle2  VARCHAR(12),               #小标题
   how    VARCHAR(500)			         #浏览
);

INSERT INTO sc_tuijian_det VALUES(NULL,"泰式红咖喱虾","det-meat4.jpg","材料","新鲜柠檬汁3汤匙，酱油1汤匙，芥末1汤匙，蒜头2粒，捣碎，红糖1汤匙，泰式红咖喱酱2茶匙，大小适中的虾500克-去皮，去虾线","做法","1.用一个浅盘或可重封的袋子将柠檬汁、酱油、芥末、蒜末、红糖和咖喱混在一起。再加入虾肉，封好或盖上盖子。在冰箱里入味一小时。

2.用高火将烧烤架预热好。在烤架上轻刷层油。然后将虾串到烧烤棒上。然后将调味料倒入炒锅煮沸几分钟。

3.将虾每边烤3分钟或直到虾肉不再透明。适时在虾上刷准备好的调味料即可。

（创建于2013-07-27）");
INSERT INTO sc_tuijian_det VALUES(NULL,"宫保鸡丁","det-meat1.jpg","材料","鸡胸肉丁200克，熟花生米50克，鸡蛋半个，蒜片10克，姜末10克，葱段15克

调味料：干红辣椒5克，生粉15克，花椒15粒，酱油10cc，黄酒5cc，白糖10克，醋10cc，盐2克，味精2克，油300cc(耗50cc)","做法","1、鸡丁放碗里加盐、黄酒、味精、鸡蛋、生粉均匀拌和上浆。

2、取小碗加酱油、糖、醋、盐、味精、湿生粉调匀兑汁。

3、铁锅加油300cc烧到6成热时放鸡丁滑油后倒出沥净。

4、锅中留油20cc先下干辣椒煸至棕红。

5、随即下花椒炸香后放下鸡丁。

6、倒入调味兑汁翻炒均匀，再加入花生米拌和。

7、炒拌均匀后出锅装盘即可。

操作要求

1、花椒，干辣椒不能煸焦。

2、卤汁紧包鸡丁。");
INSERT INTO sc_tuijian_det VALUES(NULL,"滑蛋虾仁","det-meat2.jpg","材料","虾仁200克，鸡蛋5个调味料料酒、精盐各少许，淀粉适量。","做法","1、将虾仁洗净，去掉沙线，加入盐、料酒、鸡蛋清、淀粉抓匀备用。

2、将鸡蛋打碎，蛋清和蛋黄分别放入碗中打散，加少许盐搅匀，稍放一点油。

3、油锅烧热，将蛋液分别炒熟，炒至五成熟时，将虾仁下入翻炒，熟后即可装盘。

小锦囊

◇一定要掌握滑蛋的火候，入锅时油要多，锅要热，炒好的蛋才滑嫩。

◇除了虾仁，也可以做滑蛋牛肉、滑蛋叉烧，方法及调味料都不变。只是丰料变化而已。");
INSERT INTO sc_tuijian_det VALUES(NULL,"吮指水煮虾","det-meat3.jpg","材料","
鲜虾，黄豆芽，葱，姜，蒜，干辣椒，花椒，郫县豆瓣酱，黄酒，糖，高汤或清水。","做法","1.鲜虾剪去虾枪、虾须，挑去沙包和虾线，冲洗干净备用。买回来的活虾如果不马上吃，一定要垫冰保鲜

2.黄豆芽洗净去豆皮

3.沥水备用

4.姜蒜剁末，葱切葱花，葱白和葱叶分开

5.豆瓣酱剁细

6.干辣椒煎段，花椒若干

7.起锅坐油，凉油放入花椒，小心慢慢炒出香味

8.颜色变深，放干辣椒段

9.继续小火炒至辣椒花椒有一点点焦色盛出备用

10.原油放入葱白和姜蒜末

11.炒出香味后加入豆瓣酱

12.小火炒出红油

13.加入高汤或者清水

14.煮开后放黄豆芽，加盖煮约两到三分钟

15.至黄豆芽断生即可，黄豆芽盛到大碗中，原汤留下

16.加小半勺白糖

17.适量黄酒

18.再次煮开后倒入处理干净的虾

19.加盖煮约两三分钟至虾熟透

20.连汤一起倒入放黄豆芽的大碗中，上面铺姜蒜末、葱叶和炒香的干辣椒、花椒

21.重新洗锅烧热，倒入约碗口大的油量

22.烧至冒烟后迅速浇在大碗中，随着“嗞啦”一声，吮指水煮虾即成");
INSERT INTO sc_tuijian_det VALUES(NULL,"红烧肉炖土豆","det-meat.jpg","材料","主料：五花肉，土豆，高汤，八角，桂皮，香叶，老抽，料酒。","做法","1、五花肉要洗切成麻将牌大小正方形的块，肉不要切得太小，太小易缩易碎，没有卖相了。切完后，用冷水浸没，水中放半杯料酒。放在水中浸，可以浸去毛细血管中的血水，水中加酒易于肉纤维吸收，去除肉腥。肉不宜多浸，多浸则鲜味尽失，一般浸十五分钟左右即可。
2、炒锅里放油，2大勺冰糖小火融化，到糖变颜色冒泡泡后，赶快把肉放进去不断翻炒，煸至油都靠出来，这样做出来的肉比较不腻。
3、然后准备热的高汤（没有就用清水)，大料一包（八角，桂皮，香叶等，我用的是现成的炖肉调料包），把炒锅里的肉转至砂锅中，大火烧开，加入一大勺老抽，一勺料酒，然后盖上盖子小火一直炖1个多小时，肉有七成熟时放的土豆，时间大约是起锅前20几分钟吧。（检验肉烂的标准，筷子一戳，轻易叉进肉里，说明肉烂了）最后放盐等调料，把汤汁收至粘稠即可。
（创建于2014-04-27）");

/**菜谱大全分类表**/

INSERT INTO sc_type VALUES(NULL,"肉类");
INSERT INTO sc_type VALUES(NULL,"禽蛋");
INSERT INTO sc_type VALUES(NULL,"鱼类");
INSERT INTO sc_type VALUES(NULL,"其他水产");
INSERT INTO sc_type VALUES(NULL,"根茎蔬菜");
INSERT INTO sc_type VALUES(NULL,"茎叶蔬菜");
INSERT INTO sc_type VALUES(NULL,"果实蔬菜");
INSERT INTO sc_type VALUES(NULL,"瓜类");
INSERT INTO sc_type VALUES(NULL,"菌类");
INSERT INTO sc_type VALUES(NULL,"野味蔬菜");
INSERT INTO sc_type VALUES(NULL,"干果");
INSERT INTO sc_type VALUES(NULL,"豆类");
INSERT INTO sc_type VALUES(NULL,"面类");
INSERT INTO sc_type VALUES(NULL,"米类");

INSERT INTO sc_sec_type VALUES(NULL,"猪肉",1);
INSERT INTO sc_sec_type VALUES(NULL,"排骨",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪蹄",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪肚",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪排",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪肝",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪骨",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪腰",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪脑",1);
INSERT INTO sc_sec_type VALUES(NULL,"里脊",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪头",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪血",1);
INSERT INTO sc_sec_type VALUES(NULL,"大排",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪心",1);
INSERT INTO sc_sec_type VALUES(NULL,"五花肉",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪尾巴",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪耳朵",1);
INSERT INTO sc_sec_type VALUES(NULL,"猪大肠",1);
INSERT INTO sc_sec_type VALUES(NULL,"牛肉",1);
INSERT INTO sc_sec_type VALUES(NULL,"牛排",1);
INSERT INTO sc_sec_type VALUES(NULL,"牛腩",1);
INSERT INTO sc_sec_type VALUES(NULL,"牛筋",1);
INSERT INTO sc_sec_type VALUES(NULL,"牛尾",1);
INSERT INTO sc_sec_type VALUES(NULL,"牛肚",1);
INSERT INTO sc_sec_type VALUES(NULL,"牛杂",1);
INSERT INTO sc_sec_type VALUES(NULL,"牛仔骨",1);
INSERT INTO sc_sec_type VALUES(NULL,"羊肉",1);
INSERT INTO sc_sec_type VALUES(NULL,"羊排",1);
INSERT INTO sc_sec_type VALUES(NULL,"狗肉",1);
INSERT INTO sc_sec_type VALUES(NULL,"兔肉",1);
INSERT INTO sc_sec_type VALUES(NULL,"火腿",1);
INSERT INTO sc_sec_type VALUES(NULL,"培根",1);
INSERT INTO sc_sec_type VALUES(NULL,"熏肉",1);
INSERT INTO sc_sec_type VALUES(NULL,"腊肉",1);
INSERT INTO sc_sec_type VALUES(NULL,"香肠",1);
INSERT INTO sc_sec_type VALUES(NULL,"火腿肠",1);

INSERT INTO sc_sec_type VALUES(NULL,"鸡肉",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸡翅",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸡胸",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸡腿",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸡爪",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸡胗",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸡肝",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸡心",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸡肠",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸡杂",2);
INSERT INTO sc_sec_type VALUES(NULL,"母鸡",2);
INSERT INTO sc_sec_type VALUES(NULL,"公鸡",2);
INSERT INTO sc_sec_type VALUES(NULL,"小鸡",2);
INSERT INTO sc_sec_type VALUES(NULL,"乌鸡",2);
INSERT INTO sc_sec_type VALUES(NULL,"野鸡",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸭肉",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸭肝",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸭头",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸭脖",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸭掌",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸭腿",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸭肠",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸭翅",2);
INSERT INTO sc_sec_type VALUES(NULL,"野鸭",2);
INSERT INTO sc_sec_type VALUES(NULL,"老鸭",2);
INSERT INTO sc_sec_type VALUES(NULL,"鹅肉",2);
INSERT INTO sc_sec_type VALUES(NULL,"鹅肝",2);
INSERT INTO sc_sec_type VALUES(NULL,"鹅肠",2);
INSERT INTO sc_sec_type VALUES(NULL,"鹅掌",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸽子",2);
INSERT INTO sc_sec_type VALUES(NULL,"鹌鹑",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸡蛋",2);
INSERT INTO sc_sec_type VALUES(NULL,"鸭蛋",2);
INSERT INTO sc_sec_type VALUES(NULL,"皮蛋",2);
INSERT INTO sc_sec_type VALUES(NULL,"咸蛋",2);
INSERT INTO sc_sec_type VALUES(NULL,"鹌鹑蛋",2);

INSERT INTO sc_sec_type VALUES(NULL,"鲤鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"草鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"鲫鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"鲈鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"鲶鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"带鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"黑鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"鲳鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"鳗鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"黄鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"鲢鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"青鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"桂鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"鳕鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"鲅鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"三文鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"金枪鱼",3);
INSERT INTO sc_sec_type VALUES(NULL,"鸦片鱼",3);

INSERT INTO sc_sec_type VALUES(NULL,"虾",4);
INSERT INTO sc_sec_type VALUES(NULL,"大虾",4);
INSERT INTO sc_sec_type VALUES(NULL,"对虾",4);
INSERT INTO sc_sec_type VALUES(NULL,"虾仁",4);
INSERT INTO sc_sec_type VALUES(NULL,"明虾",4);
INSERT INTO sc_sec_type VALUES(NULL,"蟹",4);
INSERT INTO sc_sec_type VALUES(NULL,"毛蟹",4);
INSERT INTO sc_sec_type VALUES(NULL,"梭子蟹",4);
INSERT INTO sc_sec_type VALUES(NULL,"珍宝蟹",4);
INSERT INTO sc_sec_type VALUES(NULL,"海参",4);
INSERT INTO sc_sec_type VALUES(NULL,"扇贝",4);
INSERT INTO sc_sec_type VALUES(NULL,"牡蛎",4);
INSERT INTO sc_sec_type VALUES(NULL,"鲍鱼",4);
INSERT INTO sc_sec_type VALUES(NULL,"鱿鱼",4);
INSERT INTO sc_sec_type VALUES(NULL,"虾米",4);
INSERT INTO sc_sec_type VALUES(NULL,"紫菜",4);
INSERT INTO sc_sec_type VALUES(NULL,"章鱼",4);
INSERT INTO sc_sec_type VALUES(NULL,"墨鱼",4);
INSERT INTO sc_sec_type VALUES(NULL,"龙虾",4);
INSERT INTO sc_sec_type VALUES(NULL,"蛤蜊",4);
INSERT INTO sc_sec_type VALUES(NULL,"海蜇",4);
INSERT INTO sc_sec_type VALUES(NULL,"田螺",4);
INSERT INTO sc_sec_type VALUES(NULL,"海螺",4);
INSERT INTO sc_sec_type VALUES(NULL,"海带",4);
INSERT INTO sc_sec_type VALUES(NULL,"泥鳅",4);

INSERT INTO sc_sec_type VALUES(NULL,"土豆",5);
INSERT INTO sc_sec_type VALUES(NULL,"山药",5);
INSERT INTO sc_sec_type VALUES(NULL,"洋葱",5);
INSERT INTO sc_sec_type VALUES(NULL,"红薯",5);
INSERT INTO sc_sec_type VALUES(NULL,"魔芋",5);
INSERT INTO sc_sec_type VALUES(NULL,"榨菜",5);
INSERT INTO sc_sec_type VALUES(NULL,"芋头",5);
INSERT INTO sc_sec_type VALUES(NULL,"竹笋",5);
INSERT INTO sc_sec_type VALUES(NULL,"莴笋",5);
INSERT INTO sc_sec_type VALUES(NULL,"茭白",5);
INSERT INTO sc_sec_type VALUES(NULL,"人参",5);
INSERT INTO sc_sec_type VALUES(NULL,"牛蒂",5);
INSERT INTO sc_sec_type VALUES(NULL,"荸荠",5);
INSERT INTO sc_sec_type VALUES(NULL,"藕",5);
INSERT INTO sc_sec_type VALUES(NULL,"白萝卜",5);
INSERT INTO sc_sec_type VALUES(NULL,"胡萝卜",5);
INSERT INTO sc_sec_type VALUES(NULL,"雪里蕻",5);

INSERT INTO sc_sec_type VALUES(NULL,"白菜",6);
INSERT INTO sc_sec_type VALUES(NULL,"芹菜",6);
INSERT INTO sc_sec_type VALUES(NULL,"韭菜",6);
INSERT INTO sc_sec_type VALUES(NULL,"豆芽",6);
INSERT INTO sc_sec_type VALUES(NULL,"油菜",6);
INSERT INTO sc_sec_type VALUES(NULL,"香菜",6);
INSERT INTO sc_sec_type VALUES(NULL,"菠菜",6);
INSERT INTO sc_sec_type VALUES(NULL,"生菜",6);
INSERT INTO sc_sec_type VALUES(NULL,"芦笋",6);
INSERT INTO sc_sec_type VALUES(NULL,"蒜苗",6);
INSERT INTO sc_sec_type VALUES(NULL,"茼蒿",6);
INSERT INTO sc_sec_type VALUES(NULL,"豆苗",6);
INSERT INTO sc_sec_type VALUES(NULL,"苋菜",6);
INSERT INTO sc_sec_type VALUES(NULL,"芥菜",6);
INSERT INTO sc_sec_type VALUES(NULL,"圆白菜",6);
INSERT INTO sc_sec_type VALUES(NULL,"小白菜",6);

INSERT INTO sc_sec_type VALUES(NULL,"茄子",7);
INSERT INTO sc_sec_type VALUES(NULL,"青椒",7);
INSERT INTO sc_sec_type VALUES(NULL,"菜花",7);
INSERT INTO sc_sec_type VALUES(NULL,"豆角",7);
INSERT INTO sc_sec_type VALUES(NULL,"豌豆",7);
INSERT INTO sc_sec_type VALUES(NULL,"扁豆",7);
INSERT INTO sc_sec_type VALUES(NULL,"豇豆",7);
INSERT INTO sc_sec_type VALUES(NULL,"西兰花",7);
INSERT INTO sc_sec_type VALUES(NULL,"西红柿",7);
INSERT INTO sc_sec_type VALUES(NULL,"黄花菜",7);
INSERT INTO sc_sec_type VALUES(NULL,"荷兰豆",7);


INSERT INTO sc_sec_type VALUES(NULL,"南瓜",8);
INSERT INTO sc_sec_type VALUES(NULL,"黄瓜",8);
INSERT INTO sc_sec_type VALUES(NULL,"冬瓜",8);
INSERT INTO sc_sec_type VALUES(NULL,"苦瓜",8);
INSERT INTO sc_sec_type VALUES(NULL,"丝瓜",8);
INSERT INTO sc_sec_type VALUES(NULL,"佛手",8);
INSERT INTO sc_sec_type VALUES(NULL,"西葫芦",8);

INSERT INTO sc_sec_type VALUES(NULL,"香菇",9);
INSERT INTO sc_sec_type VALUES(NULL,"蘑菇",9);
INSERT INTO sc_sec_type VALUES(NULL,"平菇",9);
INSERT INTO sc_sec_type VALUES(NULL,"口菇",9);
INSERT INTO sc_sec_type VALUES(NULL,"竹荪",9);
INSERT INTO sc_sec_type VALUES(NULL,"草菇",9);
INSERT INTO sc_sec_type VALUES(NULL,"银耳",9);
INSERT INTO sc_sec_type VALUES(NULL,"发菜",9);
INSERT INTO sc_sec_type VALUES(NULL,"燕窝",9);
INSERT INTO sc_sec_type VALUES(NULL,"琼脂",9);
INSERT INTO sc_sec_type VALUES(NULL,"黑木耳",9);
INSERT INTO sc_sec_type VALUES(NULL,"金针菇",9);
INSERT INTO sc_sec_type VALUES(NULL,"杏鲍菇",9);
INSERT INTO sc_sec_type VALUES(NULL,"猴头菇",9);
INSERT INTO sc_sec_type VALUES(NULL,"滑子菇",9);

INSERT INTO sc_sec_type VALUES(NULL,"百合",10);
INSERT INTO sc_sec_type VALUES(NULL,"菊花",10);
INSERT INTO sc_sec_type VALUES(NULL,"桂花",10);
INSERT INTO sc_sec_type VALUES(NULL,"香椿",10);
INSERT INTO sc_sec_type VALUES(NULL,"芽菜",10);
INSERT INTO sc_sec_type VALUES(NULL,"荠菜",10);
INSERT INTO sc_sec_type VALUES(NULL,"蕨菜",10);
INSERT INTO sc_sec_type VALUES(NULL,"冬菜",10);
INSERT INTO sc_sec_type VALUES(NULL,"橄榄菜",10);
INSERT INTO sc_sec_type VALUES(NULL,"玫瑰花",10);

INSERT INTO sc_sec_type VALUES(NULL,"花生",11);
INSERT INTO sc_sec_type VALUES(NULL,"枸杞",11);
INSERT INTO sc_sec_type VALUES(NULL,"核桃",11);
INSERT INTO sc_sec_type VALUES(NULL,"芝麻",11);
INSERT INTO sc_sec_type VALUES(NULL,"杏仁",11);
INSERT INTO sc_sec_type VALUES(NULL,"栗子",11);
INSERT INTO sc_sec_type VALUES(NULL,"莲子",11);
INSERT INTO sc_sec_type VALUES(NULL,"桂圆",11);
INSERT INTO sc_sec_type VALUES(NULL,"松子",11);
INSERT INTO sc_sec_type VALUES(NULL,"白果",11);
INSERT INTO sc_sec_type VALUES(NULL,"麦芽",11);
INSERT INTO sc_sec_type VALUES(NULL,"腰果",11);
INSERT INTO sc_sec_type VALUES(NULL,"南瓜子",11);

INSERT INTO sc_sec_type VALUES(NULL,"豆腐",12);
INSERT INTO sc_sec_type VALUES(NULL,"豆皮",12);
INSERT INTO sc_sec_type VALUES(NULL,"腐竹",12);
INSERT INTO sc_sec_type VALUES(NULL,"绿豆",12);
INSERT INTO sc_sec_type VALUES(NULL,"黑豆",12);
INSERT INTO sc_sec_type VALUES(NULL,"黄豆",12);
INSERT INTO sc_sec_type VALUES(NULL,"小豆",12);
INSERT INTO sc_sec_type VALUES(NULL,"毛豆",12);
INSERT INTO sc_sec_type VALUES(NULL,"青豆",12);
INSERT INTO sc_sec_type VALUES(NULL,"蚕豆",12);
INSERT INTO sc_sec_type VALUES(NULL,"红豆",12);
INSERT INTO sc_sec_type VALUES(NULL,"豆腐干",12);

INSERT INTO sc_sec_type VALUES(NULL,"蛋糕",13);
INSERT INTO sc_sec_type VALUES(NULL,"面包",13);
INSERT INTO sc_sec_type VALUES(NULL,"面条",13);
INSERT INTO sc_sec_type VALUES(NULL,"年糕",13);
INSERT INTO sc_sec_type VALUES(NULL,"白面",13);
INSERT INTO sc_sec_type VALUES(NULL,"吐司",13);
INSERT INTO sc_sec_type VALUES(NULL,"意面",13);
INSERT INTO sc_sec_type VALUES(NULL,"玉米面",13);
INSERT INTO sc_sec_type VALUES(NULL,"荞麦面",13);

INSERT INTO sc_sec_type VALUES(NULL,"玉米",14);
INSERT INTO sc_sec_type VALUES(NULL,"大米",14);
INSERT INTO sc_sec_type VALUES(NULL,"小麦",14);
INSERT INTO sc_sec_type VALUES(NULL,"糯米",14);
INSERT INTO sc_sec_type VALUES(NULL,"西米",14);
INSERT INTO sc_sec_type VALUES(NULL,"小米",14);
INSERT INTO sc_sec_type VALUES(NULL,"薏米",14);
INSERT INTO sc_sec_type VALUES(NULL,"黑米",14);
INSERT INTO sc_sec_type VALUES(NULL,"燕麦",14);
INSERT INTO sc_sec_type VALUES(NULL,"高粱",14);
INSERT INTO sc_sec_type VALUES(NULL,"芡实",14);


INSERT INTO sc_list VALUES(NULL,"pig01.jpg","可乐焖猪肉",1);
INSERT INTO sc_list VALUES(NULL,"pig02.jpg","卤猪肉",1);
INSERT INTO sc_list VALUES(NULL,"pig03.jpg","干炒猪肉丝",1);
INSERT INTO sc_list VALUES(NULL,"pig04.jpg","猪肉炖粉条",1);
INSERT INTO sc_list VALUES(NULL,"pig05.jpg","宫保猪肉丁",1);
INSERT INTO sc_list VALUES(NULL,"pig06.jpg","麻辣猪肉",1);
INSERT INTO sc_list VALUES(NULL,"pig07.jpg","猪肉丸子",1);
INSERT INTO sc_list VALUES(NULL,"pig08.jpg","猪肉焖板栗",1);
INSERT INTO sc_list VALUES(NULL,"pig09.jpg","家制猪肉松",1);
INSERT INTO sc_list VALUES(NULL,"pig10.jpg","猪肉酿冬菇扒菜胆",1);

INSERT INTO sc_list VALUES(NULL,"paigu01.jpg","红烧排骨",2);
INSERT INTO sc_list VALUES(NULL,"paigu02.jpg","糖醋排骨",2);
INSERT INTO sc_list VALUES(NULL,"paigu03.jpg","土豆炖排骨",2);
INSERT INTO sc_list VALUES(NULL,"paigu04.jpg","清炖排骨",2);
INSERT INTO sc_list VALUES(NULL,"paigu05.jpg","秘制烧排骨",2);
INSERT INTO sc_list VALUES(NULL,"paigu06.jpg","蒜香排骨",2);
INSERT INTO sc_list VALUES(NULL,"paigu07.jpg","冬瓜排骨汤",2);
INSERT INTO sc_list VALUES(NULL,"paigu08.jpg","椒盐排骨",2);
INSERT INTO sc_list VALUES(NULL,"paigu09.jpg","蒜香炸排骨",2);
INSERT INTO sc_list VALUES(NULL,"paigu10.jpg","玉米排骨汤",2);

INSERT INTO sc_list VALUES(NULL,"zhuti01.jpg","红烧猪蹄",3);
INSERT INTO sc_list VALUES(NULL,"zhuti02.jpg","啤酒焖猪蹄",3);
INSERT INTO sc_list VALUES(NULL,"zhuti03.jpg","黄豆焖猪蹄",3);
INSERT INTO sc_list VALUES(NULL,"zhuti04.jpg","猪蹄汤",3);
INSERT INTO sc_list VALUES(NULL,"zhuti05.jpg","酱猪蹄",3);
INSERT INTO sc_list VALUES(NULL,"zhuti06.jpg","酱汁煨猪蹄",3);
INSERT INTO sc_list VALUES(NULL,"zhuti07.jpg","香辣猪蹄",3);
INSERT INTO sc_list VALUES(NULL,"zhuti08.jpg","腐乳烧猪蹄",3);
INSERT INTO sc_list VALUES(NULL,"zhuti09.jpg","卤猪蹄",3);
INSERT INTO sc_list VALUES(NULL,"zhuti10.jpg","红酒烧猪蹄",3);

INSERT INTO sc_list VALUES(NULL,"zhudu01.jpg","炒麻辣猪肚",4);
INSERT INTO sc_list VALUES(NULL,"zhudu02.jpg","葱油猪肚",4);
INSERT INTO sc_list VALUES(NULL,"zhudu03.jpg","火爆猪肚",4);
INSERT INTO sc_list VALUES(NULL,"zhudu04.jpg","胡椒猪肚汤",4);
INSERT INTO sc_list VALUES(NULL,"zhudu05.jpg","猪肚煲土鸡",4);
INSERT INTO sc_list VALUES(NULL,"zhudu06.jpg","猪肚鸡",4);
INSERT INTO sc_list VALUES(NULL,"zhudu07.jpg","椒盐猪肚",4);
INSERT INTO sc_list VALUES(NULL,"zhudu08.jpg","酱猪肚",4);
INSERT INTO sc_list VALUES(NULL,"zhudu09.jpg","青椒爆猪肚",4);
INSERT INTO sc_list VALUES(NULL,"zhudu10.jpg","山药芥菜煲猪肚",4);

INSERT INTO sc_list VALUES(NULL,"zhupai01.jpg","酱汁猪排",5);
INSERT INTO sc_list VALUES(NULL,"zhupai02.jpg","孜然猪排",5);
INSERT INTO sc_list VALUES(NULL,"zhupai03.jpg","日式炸猪排",5);
INSERT INTO sc_list VALUES(NULL,"zhupai04.jpg","五香炸猪排",5);
INSERT INTO sc_list VALUES(NULL,"zhupai05.jpg","烤猪排",5);
INSERT INTO sc_list VALUES(NULL,"zhupai06.jpg","煎猪排",5);
INSERT INTO sc_list VALUES(NULL,"zhupai07.jpg","玉米猪排",5);
INSERT INTO sc_list VALUES(NULL,"zhupai08.jpg","洋葱焖猪排",5);
INSERT INTO sc_list VALUES(NULL,"zhupai09.jpg","香炸懒人版猪排",5);
INSERT INTO sc_list VALUES(NULL,"zhupai10.jpg","韩式泡菜炸猪排",5);

INSERT INTO sc_list VALUES(NULL,"zhugan01.jpg","爆炒猪肝",6);
INSERT INTO sc_list VALUES(NULL,"zhugan02.jpg","黑木耳炒猪肝",6);
INSERT INTO sc_list VALUES(NULL,"zhugan03.jpg","青蒜炒猪肝",6);
INSERT INTO sc_list VALUES(NULL,"zhugan04.jpg","青红椒炒猪肝",6);
INSERT INTO sc_list VALUES(NULL,"zhugan05.jpg","卤猪肝",6);
INSERT INTO sc_list VALUES(NULL,"zhugan06.jpg","黄瓜炒猪肝",6);
INSERT INTO sc_list VALUES(NULL,"zhugan07.jpg","麻辣猪肝",6);
INSERT INTO sc_list VALUES(NULL,"zhugan08.jpg","凉拌猪肝",6);
INSERT INTO sc_list VALUES(NULL,"zhugan09.jpg","土匪猪肝",6);
INSERT INTO sc_list VALUES(NULL,"zhugan10.jpg","酱爆猪肝",6);

INSERT INTO sc_list VALUES(NULL,"zhugu01.jpg","猪骨汤",7);
INSERT INTO sc_list VALUES(NULL,"zhugu02.jpg","莲藕冬瓜猪骨汤",7);
INSERT INTO sc_list VALUES(NULL,"zhugu03.jpg","无花果粉葛煲猪骨",7);
INSERT INTO sc_list VALUES(NULL,"zhugu04.jpg","猪骨菠菜汤",7);
INSERT INTO sc_list VALUES(NULL,"zhugu05.jpg","韩国猪骨头汤",7);
INSERT INTO sc_list VALUES(NULL,"zhugu06.jpg","猪骨花生粥",7);
INSERT INTO sc_list VALUES(NULL,"zhugu07.jpg","粉葛黑豆猪骨汤",7);
INSERT INTO sc_list VALUES(NULL,"zhugu08.jpg","冬瓜雪耳炖猪骨",7);
INSERT INTO sc_list VALUES(NULL,"zhugu09.jpg","鲜淮山猪骨汤",7);
INSERT INTO sc_list VALUES(NULL,"zhugu10.jpg","猪骨白菜豆腐汤",7);

INSERT INTO sc_list VALUES(NULL,"zhuyao01.jpg","山栗炖猪腰",8);
INSERT INTO sc_list VALUES(NULL,"zhuyao02.jpg","西芹炒猪腰",8);
INSERT INTO sc_list VALUES(NULL,"zhuyao03.jpg","猪腰粥",8);
INSERT INTO sc_list VALUES(NULL,"zhuyao04.jpg","杜仲猪腰汤",8);
INSERT INTO sc_list VALUES(NULL,"zhuyao05.jpg","椒盐猪腰",8);
INSERT INTO sc_list VALUES(NULL,"zhuyao06.jpg","炖猪腰",8);
INSERT INTO sc_list VALUES(NULL,"zhuyao07.jpg","青椒胡萝卜炒猪腰",8);
INSERT INTO sc_list VALUES(NULL,"zhuyao08.jpg","芸豆炖猪腰",8);
INSERT INTO sc_list VALUES(NULL,"zhuyao09.jpg","煎猪腰配红胡椒粒汁",8);
INSERT INTO sc_list VALUES(NULL,"zhuyao10.jpg","红烧猪腰",8);

INSERT INTO sc_list VALUES(NULL,"zhunao01.jpg","炖猪脑",9);
INSERT INTO sc_list VALUES(NULL,"zhunao02.jpg","清蒸猪脑髓",9);
INSERT INTO sc_list VALUES(NULL,"zhunao03.jpg","天麻炖猪脑",9);
INSERT INTO sc_list VALUES(NULL,"zhunao04.jpg","猪脑炒鸡蛋饭",9);
INSERT INTO sc_list VALUES(NULL,"zhunao05.jpg","香菇猪脑蒸蛋",9);
INSERT INTO sc_list VALUES(NULL,"zhunao06.jpg","熏卤猪脑",9);
INSERT INTO sc_list VALUES(NULL,"zhunao07.jpg","滋养开窍汤",9);
INSERT INTO sc_list VALUES(NULL,"zhunao08.jpg","天麻脑花",9);
INSERT INTO sc_list VALUES(NULL,"zhunao09.jpg","参茗补脑汤",9);

INSERT INTO sc_list VALUES(NULL,"liji01.jpg","糖醋里脊",10);
INSERT INTO sc_list VALUES(NULL,"liji02.jpg","软炸里脊",10);
INSERT INTO sc_list VALUES(NULL,"liji03.jpg","干炸里脊",10);
INSERT INTO sc_list VALUES(NULL,"liji04.jpg","炸里脊",10);
INSERT INTO sc_list VALUES(NULL,"liji05.jpg","拧香卤里脊",10);
INSERT INTO sc_list VALUES(NULL,"liji06.jpg","蜂蜜黑胡椒烤里脊",10);
INSERT INTO sc_list VALUES(NULL,"liji07.jpg","锅包肉版糖醋里脊",10);
INSERT INTO sc_list VALUES(NULL,"liji08.jpg","竹网里脊",10);
INSERT INTO sc_list VALUES(NULL,"liji09.jpg","麻辣里脊",10);
INSERT INTO sc_list VALUES(NULL,"liji10.jpg","芝麻里脊",10);

INSERT INTO sc_list VALUES(NULL,"zhutou01.jpg","扒猪头",11);
INSERT INTO sc_list VALUES(NULL,"zhutou02.jpg","卤猪之拌猪头肉头",11);
INSERT INTO sc_list VALUES(NULL,"zhutou03.jpg","宿迁猪头肉",11);
INSERT INTO sc_list VALUES(NULL,"zhutou04.jpg","酱爆猪头肉",11);
INSERT INTO sc_list VALUES(NULL,"zhutou05.jpg","东北家常酱猪头",11);
INSERT INTO sc_list VALUES(NULL,"zhutou06.jpg","白猪头肉",11);
INSERT INTO sc_list VALUES(NULL,"zhutou07.jpg","酱炒猪头肉",11);
INSERT INTO sc_list VALUES(NULL,"zhutou08.jpg","酱猪头糕",11);
INSERT INTO sc_list VALUES(NULL,"zhutou09.jpg","猪头皮",11);
INSERT INTO sc_list VALUES(NULL,"zhutou10.jpg","扒猪脸",11);

INSERT INTO sc_list VALUES(NULL,"zhuxue01.jpg","猪血豆腐",12);
INSERT INTO sc_list VALUES(NULL,"zhuxue02.jpg","猪血汤",12);
INSERT INTO sc_list VALUES(NULL,"zhuxue03.jpg","猪血炒豆芽",12);
INSERT INTO sc_list VALUES(NULL,"zhuxue04.jpg","毛血旺",12);
INSERT INTO sc_list VALUES(NULL,"zhuxue05.jpg","木耳猪血汤",12);
INSERT INTO sc_list VALUES(NULL,"zhuxue06.jpg","韭菜炒猪血",12);
INSERT INTO sc_list VALUES(NULL,"zhuxue07.jpg","酸菜炒猪血",12);
INSERT INTO sc_list VALUES(NULL,"zhuxue08.jpg","洋参猪血豆芽汤",12);
INSERT INTO sc_list VALUES(NULL,"zhuxue09.jpg","猪血糕",12);
INSERT INTO sc_list VALUES(NULL,"zhuxue10.jpg","韭菜猪血汤",12);

INSERT INTO sc_list VALUES(NULL,"dapai01.jpg","红烧大排",13);
INSERT INTO sc_list VALUES(NULL,"dapai02.jpg","葱香大排",13);
INSERT INTO sc_list VALUES(NULL,"dapai03.jpg","烧汁大排",13);
INSERT INTO sc_list VALUES(NULL,"dapai04.jpg","酥炸猪大排",13);
INSERT INTO sc_list VALUES(NULL,"dapai05.jpg","枸杞汁大排",13);
INSERT INTO sc_list VALUES(NULL,"dapai06.jpg","炬烤大排",13);
INSERT INTO sc_list VALUES(NULL,"dapai07.jpg","五香熏大排",13);
INSERT INTO sc_list VALUES(NULL,"dapai08.jpg","咸菜大排面",13);
INSERT INTO sc_list VALUES(NULL,"dapai09.jpg","黑椒烤大排",13);
INSERT INTO sc_list VALUES(NULL,"dapai10.jpg","烤猪大排骨",13);

INSERT INTO sc_list VALUES(NULL,"zhuxin01.jpg","蒜爆猪心",14);
INSERT INTO sc_list VALUES(NULL,"zhuxin02.jpg","青椒炒猪心",14);
INSERT INTO sc_list VALUES(NULL,"zhuxin03.jpg","葱爆猪心",14);
INSERT INTO sc_list VALUES(NULL,"zhuxin04.jpg","龙眼肉煲猪心汤",14);
INSERT INTO sc_list VALUES(NULL,"zhuxin05.jpg","参归炖猪心",14);
INSERT INTO sc_list VALUES(NULL,"zhuxin06.jpg","黑木耳炖猪心",14);
INSERT INTO sc_list VALUES(NULL,"zhuxin07.jpg","参归猪心",14);
INSERT INTO sc_list VALUES(NULL,"zhuxin08.jpg","猪心当归汤",14);
INSERT INTO sc_list VALUES(NULL,"zhuxin09.jpg","风味手撕猪心",14);
INSERT INTO sc_list VALUES(NULL,"zhuxin10.jpg","笋干炒猪心",14);

INSERT INTO sc_list VALUES(NULL,"whr01.jpg","酱香五花肉",15);
INSERT INTO sc_list VALUES(NULL,"whr02.jpg","红烧五花肉",15);
INSERT INTO sc_list VALUES(NULL,"whr03.jpg","蜜汁五花肉",15);
INSERT INTO sc_list VALUES(NULL,"whr04.jpg","香煎五花肉",15);
INSERT INTO sc_list VALUES(NULL,"whr05.jpg","蒸五花肉",15);
INSERT INTO sc_list VALUES(NULL,"whr06.jpg","五花肉卷金针菇",15);
INSERT INTO sc_list VALUES(NULL,"whr07.jpg","香辣五花肉",15);
INSERT INTO sc_list VALUES(NULL,"whr08.jpg","韩国辣酱烤五花肉",15);
INSERT INTO sc_list VALUES(NULL,"whr09.jpg","五花肉烩玉米",15);
INSERT INTO sc_list VALUES(NULL,"whr10.jpg","韩式泡菜炒五花肉",15);

INSERT INTO sc_list VALUES(NULL,"zwb01.jpg","蒜卤猪尾巴",16);
INSERT INTO sc_list VALUES(NULL,"zwb02.jpg","卤猪尾",16);
INSERT INTO sc_list VALUES(NULL,"zwb03.jpg","酱猪尾",16);
INSERT INTO sc_list VALUES(NULL,"zwb04.jpg","三杯猪尾",16);
INSERT INTO sc_list VALUES(NULL,"zwb05.jpg","红烧猪尾",16);
INSERT INTO sc_list VALUES(NULL,"zwb06.jpg","木瓜煲猪尾",16);
INSERT INTO sc_list VALUES(NULL,"zwb07.jpg","红烧猪尾",16);
INSERT INTO sc_list VALUES(NULL,"zwb08.jpg","花生煲猪尾",16);
INSERT INTO sc_list VALUES(NULL,"zwb09.jpg","土豆烧猪尾",16);
INSERT INTO sc_list VALUES(NULL,"zwb10.jpg","鸿运猪尾煲",16);

INSERT INTO sc_list VALUES(NULL,"zed01.jpg","凉拌猪耳朵",17);
INSERT INTO sc_list VALUES(NULL,"zed02.jpg","葱香猪耳朵",17);
INSERT INTO sc_list VALUES(NULL,"zed03.jpg","香辣卤猪耳朵",17);
INSERT INTO sc_list VALUES(NULL,"zed04.jpg","茶香猪耳朵",17);
INSERT INTO sc_list VALUES(NULL,"zed05.jpg","拌猪耳朵",17);
INSERT INTO sc_list VALUES(NULL,"zed06.jpg","凉拌猪耳朵",17);
INSERT INTO sc_list VALUES(NULL,"zed07.jpg","卤水猪耳朵",17);
INSERT INTO sc_list VALUES(NULL,"zed08.jpg","拌猪耳朵",17);
INSERT INTO sc_list VALUES(NULL,"zed09.jpg","猫耳朵",17);
INSERT INTO sc_list VALUES(NULL,"zed10.jpg","猫耳朵",17);

INSERT INTO sc_list VALUES(NULL,"zdc01.jpg","爆炒猪大肠",18);
INSERT INTO sc_list VALUES(NULL,"zdc02.jpg","生炒猪大肠",18);
INSERT INTO sc_list VALUES(NULL,"zdc03.jpg","卤猪大肠",18);
INSERT INTO sc_list VALUES(NULL,"zdc04.jpg","酸菜炒猪大肠",18);
INSERT INTO sc_list VALUES(NULL,"zdc05.jpg","青红椒炒猪大肠",18);
INSERT INTO sc_list VALUES(NULL,"zdc06.jpg","藩红猪大肠",18);
INSERT INTO sc_list VALUES(NULL,"zdc07.jpg","炒猪大肠",18);
INSERT INTO sc_list VALUES(NULL,"zdc08.jpg","凤尾大肠",18);
INSERT INTO sc_list VALUES(NULL,"zdc09.jpg","大肠头",18);
INSERT INTO sc_list VALUES(NULL,"zdc10.jpg","大肠煲",18);

INSERT INTO sc_index_top VALUES(NULL,"mor01.jpg","香河肉饼","营养丰富,早餐最爱");
INSERT INTO sc_index_top VALUES(NULL,"mor02.jpg","酱香饼","美味营养,吃完元气满满");
INSERT INTO sc_index_top VALUES(NULL,"mor03.jpg","小炒肉","富含蛋白质,强身健体");
INSERT INTO sc_index_top VALUES(NULL,"mor04.jpg","油泼面","富含碳水化合物,补充能量");
INSERT INTO sc_index_top VALUES(NULL,"mor05.jpg","混沌皮苹果派","补充VC,补充能量");
INSERT INTO sc_index_top VALUES(NULL,"mor06.jpg","低脂自制雪糕","健康自制,美味无添加");
INSERT INTO sc_index_top VALUES(NULL,"mor07.jpg","豌豆凉粉","富含碳水化合物,缓解疲劳");
INSERT INTO sc_index_top VALUES(NULL,"mor08.jpg","香蒸排骨","富含优质蛋白,补肾润肺");
INSERT INTO sc_index_top VALUES(NULL,"mor09.jpg","香卤豆皮卷","补充矿物质,增强免疫力");
INSERT INTO sc_index_top VALUES(NULL,"mor10.jpg","脆藕饼","膳食纤维丰富,健脾开胃");





INSERT INTO sc_tuijian_top VALUES(NULL,"In-list0.jpg","咖喱虾","1238","19886");
INSERT INTO sc_tuijian_top VALUES(NULL,"In-list01.jpg","大几条腿","1723","199886");
INSERT INTO sc_tuijian_top VALUES(NULL,"In-list02.jpg","滑蛋虾仁","1723","199886");
INSERT INTO sc_tuijian_top VALUES(NULL,"In-list03.jpg","水煮虾","1723","199886");
INSERT INTO sc_tuijian_top VALUES(NULL,"In-list05.jpg","红烧肉炖土豆","1723","199886");
INSERT INTO sc_collect VALUES(NULL,"zwb01.jpg","红烧肉炖土豆",1);


INSERT INTO sc_que VALUES(NULL,"珍珠奶茶里的木薯淀粉可以用什么替代",1);
INSERT INTO sc_que VALUES(NULL,"玉米淀粉可以做珍珠奶茶吗",1);
INSERT INTO sc_que VALUES(NULL,"做豆腐脑一斤豆子加多少斤水泡，一斤豆子用多少内脂，为什么我做的豆腐脑水多又很老，一点都不嫩",1);




