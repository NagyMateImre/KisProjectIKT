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
    const regexPhoneNumberValidator = /^(?:\+36|06)(?:1|\d{2})\d{7,8}$/;
    if(Mobil.value.length === 0 || regexPhoneNumberValidator.test(number.replace(/[^\d+]/g, ''))){
        Mobil.style.background = "white";
    } else {
        Mobil.style.background = "red";
    }
}

function CarValidator(){
    console.log(CarRadio[0].checked);
}

function PCValidator(){
console.log(PCRadio[0].checked);
}

function Reset(){
    window.location.reload();
}

function SubmitForm(){
    if((Name.style.background === "white" && Email.style.background === "white" && Mobil.style.background === "white")&& (Name.value.length > 0 && Email.value.length > 0 && Mobil.value.length > 0 && Password.value.length > 0)){
        fetch('http://localhost/KisProject/HTML/reg.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                nev: Name.value,
                loginName: LoginName.value,
                mobil: Mobil.value,
                email: Email.value,
                password: Password.value,
                car: CarRadio[0].checked,
                pc: PCRadio[0].checked,
                roles: roles.value
            })
        })
        Reset();
    }
    else{
        alert("Nem megfelelő adatok! Kérlek ellenőrizd a mezőket!");
    }
}