<template>
  <div class="home">
    <div class="container">
      <div class="home__inner">
        <div class="home__menu">
          <h1>ДОБРО ПОЖАЛОВАТЬ</h1>
          <div class="link__inner">
            <router-link class="home__link" to="/news">Новости</router-link>
            <router-link class="home__link" to="/materials">Обучение</router-link>
          </div>
        </div>
        <img src="../../public/main.png" width="622" height="500" alt="">
      </div>
    </div>
  </div>
</template>

<script>

</script>

<style scoped>
.home__inner {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 0px 100px;
}

.home__menu > h1 {
  font-weight: 400;
  font-size: 36px;
}

.link__inner {
  display: grid;
  margin: 55px 0px;
}

.home__link {
  border: 1px solid #000;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 395px;
  height: 59px;
  text-decoration: none;
  color: #000;
  margin: 10px 0px;
  font-size: 16px;
}

</style>
