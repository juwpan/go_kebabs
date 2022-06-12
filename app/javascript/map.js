const render = (() => {
  
  ymaps.ready(init);

  function init(){

    const eventname = document.getElementById('map').getAttribute('name-event')
    const address = document.getElementById('map').getAttribute('event-address')
    const eventauthor = document.getElementById('map').getAttribute('author-event')
    const eventdescription = document.getElementById('map').getAttribute('description-event')
    const images = document.getElementById('map').getAttribute('images')

    const myMap = new ymaps.Map('map', {
      center: [55.76, 37.64],
      zoom: 10,
    }, {
      searchControlProvider: 'yandex#search'
    });

    const myGeocoder = ymaps.geocode(address);

    myGeocoder.then(
      function (res) {
        coordinates = res.geoObjects.get(0).geometry.getCoordinates();

        myMap.geoObjects.add(
          placemark = new ymaps.Placemark(
            coordinates, {
              balloonContentHeader: eventname,
              balloonContentBody:
                `<div><img class="mb-3" src=${images} height="150" width="200"></div>
                <div> ${address} </div> ${eventdescription}`,
              balloonContentFooter: `<p>Автор мероприятия: <b class="event-author"> ${eventauthor} </b></p>`,
              hintContent: eventname
          },
            { preset: 'islands#nightDotIcon' }
          ),

        );
        myMap.setCenter(coordinates);
        myMap.setZoom(15);
        placemark.balloon.open();
      }, function (err) {
        alert('Ошибка при определении местоположения');
      });
    }
})

document.addEventListener("turbo:load", render)
