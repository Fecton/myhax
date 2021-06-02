<h1 align=center>BASH-scripts for fast configuring device</h1>

<ul>
  <div>
      <li><h2>lcd.sh</h2></li>
      <p>Скрипт для установки драйвера для LCD-дисплеев для Raspberry PI:</p>
        <ul>
          <li><b>install (-i)</b> - установка всех компонентов</li>
          <li><b>start   (-s)</b> - запуск драйвера</li>
          <li><b>hdmi    (-H)</b> - вернуться в прежний режим</li>
          <li><b>delete  (-d)</b> - удалить драйвер</li>
          <li><b>help    (-h)</b> - показать краткую справку</li>
        </ul>
    <h4>Компоненты:</h4>
    <ul>
        <li>git</li>
        <li>Оф. драйвер от waveshare: https://github.com/waveshare/LCD-show.git</li>
    </ul>
  </div>
  <li><h2>tor.sh</h2></ li>
  <div>
    <p>Скрпит для установки и быстрого запуска необходимых компонентов TOR</p>
    <ul>
        <li><b>help (-h)</b> - показать краткую справку</li>
        <li><b>install (-i)</b> - установить все компоненты</li>
        <li><b>start (-s)</b> - запуск компонентов</li>
        <li><b>stop (-S)</b> - остановка компонентов</li>
        <li><b>changeIP (-c)</b> - принудительно сменить IP-адрес</li>
        <li><b>ip (-ip)</b> - показать текущий IP-адрес в глоб. сети</li>
        <li><b>delete (-d)</b> - удалить компоненты</li>
    </ul>
    <h4>Компоненты: </h4>
    <ul>
        <li>git</li>
        <li>python2</li>
        <li>wget</li>
        <li>tor</li>
        <li>toriptables2: https://github.com/ruped24/toriptables2.git</li>
    </ul>
  </div>
</ul>
