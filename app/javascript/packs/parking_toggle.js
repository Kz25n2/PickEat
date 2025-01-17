document.addEventListener("DOMContentLoaded", function() {
  toggleParkingCapacityField();

  document.querySelectorAll('input[name="restaurant[parking_lot]"]').forEach(function(radio) {
    radio.addEventListener("change", function() {
      toggleParkingCapacityField();
    });
  });

  function toggleParkingCapacityField() {
    const parkingYes = document.getElementById("parking_yes");
    const parkingNo = document.getElementById("parking_no");
    const parkingCapacityField = document.getElementById("parking_capacity_field");

    if (parkingYes.checked) {
      parkingCapacityField.style.display = "block";
    } else {
      parkingCapacityField.style.display = "none";
    }
  }

});