function login() {
    appcan.device.getInfo(13, function(err, data, dataType, optId) {
        var obj = JSON.parse(data);
        if (obj.connectStatus == -1) {
            $alert('网络联系异常，请检查！')
            return
        } else {

        }
    })

    var userName = $('#phone').val();
    var password = $('#password').val();
    if (!isDefine(password)) {
        $alert("请输入密码！")
        return;
    }
    if (!isDefine(userName)) {
        $alert("请输入账号！")
        return;
    }
    setLocVal("telphone",userName);
    var url = dataUrl + '/user/login.json?username=' + userName + '&password=' + password + '&deviceToken=' + deviceToken;
    $toast("正在登录中，请稍后！");
    $.ajax({
        url: url,
        type: 'POST',
        data: {},
        cache: false,
        dataType: 'json',
        contentType: "application/json",
        success: function(json) {
            $closeToast();
            console.log(JSON.stringify(json))
            
            if(!json.success){
                $alert(json.resultMessage);
                return;
            }

            if (isDefine(json.data.token)) {                
                uexWidget.setPushInfo(userName, userName); //绑定推送用户
                setLocVal('token', json.data.token);
                setLocVal("userId",json.data.userId);
                
                var lastUrl = getLocVal("lastUrl");
                if(isDefine(lastUrl)){
                    appcan.window.open({
                        name: lastUrl,
                        data: lastUrl + '.html',
                        aniId: '10'
                    });
                    
                    setLocVal("lastUrl", "");
                    appcan.window.evaluateScript('login', 'appcan.window.close()');
                }else{
                    appcan.window.open({
                        name: 'index',
                        data: 'index.html',
                        aniId: '10'
                    });
                }

                setLocVal('userName', userName);
                setLocVal('passWord', password);
            } else {
                $alert('登录失败')
            }
            //  console.log("userInfo===="+JSON.stringify(json))                   
        },
        error: function(jqXHR, textStatus, err) {
            if (textStatus == "abort" || textStatus == "timeout") {
                $alert("貌似网络不太稳定，请稍后再试。")
                return
            }
            $closeToast();
            $alert("登录失败，请输入正确的用户名或密码。");
        }
    });
}
