document.addEventListener('turbolinks:load', function() {
  const nearbyButton = document.querySelector('.nearby-button');
  
  if (nearbyButton) {
    nearbyButton.addEventListener('click', function(e) {
      e.preventDefault();
      
      if ('geolocation' in navigator) {
        navigator.geolocation.getCurrentPosition(
          function (position) {
            // 位置情報取得成功
            const latitude = position.coords.latitude;
            const longitude = position.coords.longitude;

            // データ属性から遷移先URLを取得
            const targetPath = nearbyButton.dataset.targetPath;

            // コントローラーに位置情報を送信
            window.location.href = `${targetPath}?nearby=true&latitude=${latitude}&longitude=${longitude}`;
          },
          function (error) {
            // 位置情報取得失敗
            alert('位置情報の取得に失敗しました。位置情報の使用を許可してください。');
          }
        );
      } else {
        alert('お使いのブラウザは位置情報の取得に対応していません。');
      }
    });
  }
});