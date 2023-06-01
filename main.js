var araclar = []
var modlu = []
var silahlar = []
var pedler = []

$(function() {
    window.addEventListener('message', function(event) {
    var type = event.data.type
    var data = event.data
    if (event.data.type === 'open'){
        $('.container').fadeIn(500);
        araclar = event.data.cars
        modlu = event.data.modlular
        silahlar = event.data.silahlar
        pedler = event.data.pedler
        loadCars()
    }
})});

function loadCars() {
    for (let index = 0; index < araclar.length; index++) {
        const element = araclar[index];
        let chtml = "";
        let arabaModel = element.toUpperCase()
        let link = `https://docs.fivem.net/vehicles/${element}.webp`
        chtml = `<div id="arabasec" model="${element}" class="sira"><img class="img" src="${link}">
        <h1 class="ayarlamalax">${arabaModel}</h1></div>`
        $('#carList').append(chtml);
    }
}

function loadModluAraclar(){
    $('#modlulist').html("")
    $('#modlulist').fadeIn(500);
    $('#pedlerx').hide()
    for (let index = 0; index < modlu.length; index++) {
        const element = modlu[index];
        let cml = ''
        cml = `<div id="arabasec" model='${element.model}' class='arabax'><h1 class='hirsizz'>${element.label}</h1></div>`
        $('#modlulist').append(cml)
    }
}

function loadSilahlar(){
    $('#modlulist').hide();
    $('#pedler2').hide();
    $('#silahlar').fadeIn(500)
    for (let index = 0; index < silahlar.length; index++) {
        const element = silahlar[index];
        let silahad = element.toUpperCase()
        let cml = ''
        cml = `<div id="silahsec" model='${element}' class='arabaxv2'><img src="https://raw.githubusercontent.com/overextended/ox_inventory/main/web/images/${silahad}.png" class="silahresim">
        <h1 class="silahName">${silahad}</h1></div>`
        $('#silahlarbaba').append(cml)
    }
}

function loadpedler(){
    $('#silahlar').hide();
    $('#modlulist').hide();
    $('#pedler2').fadeIn(500)
    $('#pedlerx').show()
    for (let index = 0; index < pedler.length; index++) {
        const element = pedler[index];
        let cml = ''
        cml = `<div id="pedsec" model='${element}' class='arabaxv2'><img src="https://docs.fivem.net/peds/${element}.webp" class="silahresim2"></div>`
        $('#pedlerx').append(cml)
    }
}

$(document).on('click','#silahsec',function(){
    $.post('http://kibra-fun/silahVer', JSON.stringify({
        model: $(this).attr("model"),
    }));
    close()
    $.post('http://kibra-fun/close', JSON.stringify({}))
})

$(document).on('click','#pedsec',function(){
    $.post('http://kibra-fun/setped', JSON.stringify({
        model: $(this).attr("model"),
    }));
    close()
    $.post('http://kibra-fun/close', JSON.stringify({}))
})

document.onkeyup = function(data){
    if (data.which == 27){
       close()
    }
}

function close(){
    $('.container').fadeOut(500);
    $('#carList').html("");
    $('#portal').show();
    $('#modluarabalar').hide()
    $('#modlulist').html("")
    window.scrollTo(0, 0);
    $.post('http://kibra-fun/close', JSON.stringify({}))
}

$(document).on('click','#yukle',function(){
    $('#portal').hide()
    $('#silahlar').hide()
    $('#modluarabalar').fadeIn(500);
    loadModluAraclar()
})

$(document).on('click','#normal',function(){
    $('#modluarabalar').hide()
    $('#carList').html("");
    $('#pedlerx').html('')
    $('#silahlar').hide()
    $('#portal').fadeIn(500);
    loadCars()
})

$(document).on('click','#silahlarx',function(){
    $('#modluarabalar').hide()
    $('#portal').hide();
    loadSilahlar()
})

$(document).on('click','#pedler',function(){
    $('#modluarabalar').hide()
    $('#carList').html("");
    $('#portal').hide();
    $('#silahlar').hide()
    loadpedler()
})

$(document).on('click','#arabasec',function(){
    console.log("ssd")
    $.post('http://kibra-fun/secilenAraba', JSON.stringify({
        model: $(this).attr("model"),
        plaka: $("#plaka").val()
    }));
    $('.container').fadeOut(500);
    $('#carList').html("");
    $.post('http://kibra-fun/close', JSON.stringify({}))
})

function filterCars() {
    let arananAracAdi = document.getElementById('searchBox').value;
    let carListDiv = document.getElementById('carList');
    
    // Araç listesini temizle
    carListDiv.innerHTML = '';
  
    // Eğer aranan araç adı boşsa tüm araçları listele, değilse filtreyi uygula
    let listelenecekAraclar = arananAracAdi ? 
      araclar.filter(arac => arac.toLowerCase().includes(arananAracAdi.toLowerCase())) : 
      loadCars();
  
    // Araç listesini güncelle
    listelenecekAraclar.forEach(function(arac) {
      let img = document.createElement('img');
      img.src = `https://docs.fivem.net/vehicles/${arac}.webp`
      img.onclick = function() { spawnCar(arac); };
      img.class = 'resim'
        
      carListDiv.appendChild(img);
    });
  }
  
  function spawnCar(araba) {
    $.post('http://kibra-fun/secilenAraba', JSON.stringify({
        model: araba,
    }));
    $('.container').fadeOut(500);
    $('#carList').html("");
    $.post('http://kibra-fun/close', JSON.stringify({}))
  }

  
  