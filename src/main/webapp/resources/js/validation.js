/**
 * 유효성 검사 함수
 */
const valiCheckJoin = function(form){
	let result = false;
	let text = "";
	
	const mId = form.m_id.value;
	const id_reg_exp = /^[a-z]+[a-z0-9]{4,19}$/g;
	
	const mPw = form.m_pw.value;
	const pw_reg_exp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	
	const mPwCheck = form.m_pw_check.value;
	
	const mName = form.m_name.value;
	const name_reg_exp = /^[가-힣]{2,4}$/;
	
	const mMail = form.m_mail.value;
	const mail_reg_exp =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if(mId.length == 0){
		text += "아이디를 입력하세요.";
	} else if(id_reg_exp.test(mId) == false){
		text += "아이디는 5 ~20자, 영문자와 숫자를 포함해주세요.";
	} else if(mPw.length == 0){
		text += "비밀번호를 입력하세요.";
	} else if(pw_reg_exp.test(mPw) == false){
		text += "비밀번호는 8~16자, 영문자, 숫자, 특수문자 한가지 이상 포함해주세요.";
	} else if(mPw != mPwCheck){
		text += "비밀번호가 일치하는지 확인하세요.";
	} else if(mName.length == 0){
		text += "이름을 입력하세요.";
	} else if(name_reg_exp.test(mName) == false){
		text += "이름은 한글 2~4자 이내로 입력하세요.";
	} else if(mMail.length == 0){
		text += "이메일을 입력하세요.";
	} else if(mail_reg_exp.test(mMail) == false){
		text += "이메일 형식을 지켜서 작성해주세요.";
	} else{
		result = true;
	}
	
	if(result == false){
		Swal.fire({
		  icon: 'error',
		  title: '실패' ,
		  text: text,
		});
	}
	
	return result;
}