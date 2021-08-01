const bdark = document.querySelector('#dark');
const body = document.querySelector('body');

load();
bdark.addEventListener('click', event=>{
body.classList.toggle('darkmode');
store(body.classList.contains('darkmode'));
});

function load(){
const darkmode = localStorage.getItem('darkmode');

if(!darkmode){
    store('false');
}   else if(darkmode == 'true')
    {
        body.classList.add('darkmode');
    }

}
function store(value){
    localStorage.setItem('darkmode',value);
}