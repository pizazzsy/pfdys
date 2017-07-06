/**
 * 身份证15位编码规则：dddddd yymmdd xx p
 * dddddd：地区码
 * yymmdd: 出生年月日
 * xx: 顺序类编码，无法确定
 * p: 性别，奇数为男，偶数为女
 * <p />
 * 身份证18位编码规则：dddddd yyyymmdd xxx y
 * dddddd：地区码
 * yyyymmdd: 出生年月日
 * xxx:顺序类编码，无法确定，奇数为男，偶数为女
 * y: 校验码，该位数值可通过前17位计算获得
 * <p />
 * 18位号码加权因子为(从右到左) Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2,1 ]
 * 验证位 Y = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ]
 * 校验位计算公式：Y_P = mod( ∑(Ai×Wi),11 )
 * i为身份证号码从右往左数的 2...18 位; Y_P为脚丫校验码所在校验码数组位置
 *
 */

var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];// 加权因子
var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];// 身份证验证位值.10代表X
function IdCardValidate(idCard) {
	idCard = trim(idCard);
	if (idCard.length == 15) {
		return true;
	} else if (idCard.length == 18) {
		var a_idCard = idCard.split("");// 得到身份证数组
		if(isTrueValidateCodeBy18IdCard(a_idCard)){
			return true;
		}else {
			 $alert( "身份证号不合法！" );
			return false;
		}
	} else {
		 $alert( "身份证的长度不对！" );
		return false;
	}
}
/**
 * 判断身份证号码为18位时最后的验证位是否正确
 * @param a_idCard 身份证号码数组
 * @return
 */
function isTrueValidateCodeBy18IdCard(a_idCard) {
	var sum = 0; // 声明加权求和变量
	if (a_idCard[17].toLowerCase() == 'x') {
		a_idCard[17] = 10;// 将最后位为x的验证码替换为10方便后续操作
	}
	for ( var i = 0; i < 17; i++) {
		sum += Wi[i] * a_idCard[i];// 加权求和
	}
	valCodePosition = sum % 11;// 得到验证码所位置
	if (a_idCard[17] == ValideCode[valCodePosition]) {
		return true;
	} else {
		//$alert( "身份证最后的验证位不正确！" );
		$alert( "身份证号不合法" );
		return false;
	}
}
/**
 * 通过身份证判断是男是女
 * @param idCard 15/18位身份证号码
 * @return 'F'-女、'M'-男
 */
function maleOrFemalByIdCard(idCard){
	idCard = trim(idCard.replace(/ /g, ""));// 对身份证号码做处理。包括字符间有空格。
	if(idCard.length==15){
		if(idCard.substring(14,15)%2==0){
			return 'F';
		}else{
			return 'M';
		}
	}else if(idCard.length ==18){
		if(idCard.substring(14,17)%2==0){
			return 'F';
		}else{
			return 'M';
		}
	}else{
		return null;
	}
}
 /**
* 验证18位数身份证号码中的生日是否是有效生日
* @param idCard 18位书身份证字符串
* @return
*/
function isValidityBrithBy18IdCard(idCard18){
	var year =idCard18.substring(6,10);
	var month = idCard18.substring(10,12);
	var day = idCard18.substring(12,14);
	var date = year + "-"+month+"-"+day; 
	var temp_date = new Date(date).getDate(); 
	alert(new Date(date))
	if(temp_date == date.substring(date.length-2)){
	    return true;
	}else{
	    $alert("18位身份证日期不合法");
	    return false;
	}
	
}
/**
* 验证15位数身份证号码中的生日是否是有效生日
* @param idCard15 15位书身份证字符串
* @return
*/
function isValidityBrithBy15IdCard(idCard15){
	var year =idCard15.substring(6,8);
	var month = idCard15.substring(8,10);
	var day = idCard15.substring(10,12);
	var date = year + "-"+month+"-"+day; 
    var temp_date = new Date(date).getDate(); 
    if(temp_date == date.substring(date.length-2)){
        return true;
    }else{
        $alert("15位身份证日期不合法");
        return false;
    }
}
//去掉字符串头尾空格
function trim(str) {
	return str.replace(/(^\s*)|(\s*$)/g, "");
}


function getAgeFromIdCard(idCard, birthday){
	var now = new Date();
	if(idCard != null && idCard != ""){
	if(idCard!=undefined&&IdCardValidate(idCard)){
		if(idCard.length==15){
			return now.getYear()-parseInt(idCard.substring(6,8));
		}else if(idCard.length ==18){
			return now.getFullYear()-parseInt(idCard.substring(6,10));
		}else{
			return "";
		}
	}
	return "";
	}else if(birthday != null && birthday != ""){	
		return now.getFullYear()-parseInt(birthday.substring(0,4));
	}else{
		return "";
	}
	
}