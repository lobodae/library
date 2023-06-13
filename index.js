function message(){
    var username = document.getElementById('username');
    var email = document.getElementById('email');
    var password = document.getElementById('password');
    const success = document.getElementById('success');
    const danger = document.getElementById('danger');

    if(username.value === '' || email.value === '' || password.value === ''){
        danger.style.display = 'block';

    }
    else{
        setTimeout(() => {
        username.value = '';
        email.value = '';
        password.value = '';
        }, 2000);

       
    }
    setTimeout(() => {
        danger.style.display = 'none';
       
    }, 4000);
}