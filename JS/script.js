const Name = document.getElementById('input-Name');
const LoginName = document.getElementById('input-Login-Name');
const Mobil = document.getElementById('input-Mobil');
const Email = document.getElementById('input-Email');
const Password = document.getElementById('input-Password');
const CarRadio = document.querySelectorAll('input[name="CarYn"]');
const PCRadio = document.querySelectorAll('input[name="PCYn"]');
const roles = document.getElementById('roles');

function NameValidator(){
    const containsNumber = /\d/.test(Name.value);

    if(!containsNumber || Name.value.lenght === 0){
        Name.style.background = "white";
    }
    else{
        Name.style.background = "red";
    }
}

function PasswordValidator(password) {
    if (password.length === 0) {
        Password.style.background = "white";
        return;
    }

    const regexPasswordValidator = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;

    if (regexPasswordValidator.test(password)) {
        Password.style.background = "white";
    } else {
        Password.style.background = "red";
    }
}

function EmailValidator(email) {
    const regexEmailValidator = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    const trimmedEmail = email.trim();

    if (trimmedEmail.length === 0 || regexEmailValidator.test(trimmedEmail)) {
        Email.style.background = "white";
    } else {
        Email.style.background = "red";
    }
}

function PhoneNumberValidator(number){
    const regexPhoneNumberValidator = /^(?:\+36|06)(?:1|\d{2})\d{7,7}$/;
    if(Mobil.value.length === 0 || regexPhoneNumberValidator.test(number.replace(/[^\d+]/g, ''))){
        Mobil.style.background = "white";
    }
    else{
        Mobil.style.background = "red";   
    }
}

function CarValidator(CarRadio){
    for (const radio of CarRadio) {
        if (radio.checked) {
            return radio.value;
        }
    }
    return '';
}

function PCValidator(PCRadio){
    for (const radio of PCRadio) {
        if (radio.checked) {
            return radio.value;
        }
    }
    return '';
}

function Reset(){
    window.location.reload();
}

function SubmitForm(){
    if((Name.style.background === "white" && Email.style.background === "white" && Mobil.style.background === "white")&& (Name.value.length > 0 && Email.value.length > 0 && Mobil.value.length > 0 && Password.value.length > 0)){
        
        const formData = new FormData();
        formData.append('nev', Name.value);
        formData.append('loginName', LoginName.value);
        formData.append('mobil', Mobil.value);
        formData.append('email', Email.value);
        formData.append('password', Password.value);
        formData.append('car', CarValidator(CarRadio));
        formData.append('pc', PCValidator(PCRadio));
        formData.append('roles', roles.value);

        fetch('http://localhost/KisProjectIKT/HTML/reg.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            console.log(data);
            if(data.status === "success") {
                alert(data.message);
                Reset();
            } else {
                alert("Hiba: " + data.message);
            }
        })
        .catch(error => {
            console.error('Hiba történt:', error);
        });
    }
    else{
        alert("Nem megfelelő adatok! Kérlek ellenőrizd a mezőket!");
    }
}