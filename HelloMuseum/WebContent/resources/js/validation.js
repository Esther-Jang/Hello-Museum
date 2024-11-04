function check() {
	var form = document.newExhibit;
	var regId = /^e[0-9]{1,8}$/;
	var regDate = /^\d{4}-\d{2}-\d{2}/;
	var regUrl = /^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
	var eId = form.exhibitId.value;
	var openDate = form.openDate.value;
	var closeDate = form.closeDate.value;
	var url = form.url.value;

	if (!regId.test(eId)) {
		alert("[전시번호]\ne와 숫자를 조합하여 2~9자까지 입력하세요\n첫글자는 반드시 e로 시작하세요");
		form.eId.select();
		form.eId.focus();
		return false;
	} else if (!regDate.test(openDate) || !regDate.test(closeDate)) {
		alert("[날짜]\n날짜는 YYYY-MM-DD형식으로 입력해주세요");
		form.openDate.select();
		form.closeDate.select();
		return false;
	} else if (!regUrl.test(url)) {
		alert("[url]\n주소를 정확히 입력해주세요.");
		form.url.select();
		form.url.focus();
		return false;
	}

	form.submit();

}