<template>
    <h1 v-if="_success == false" style="text-align: center; color: red; margin: 15px 0px 50px 0px;">Сначала авторизируйтесь</h1>
    <div v-if="Auth()" class="profile view">
        <div v-if="_success == true" class="container">
            <div>
                <div class="breadcrumb"><router-link class="nav__breadcrumb" to="/">Главная</router-link> / Профиль</div>
                <hr class="breadcrumb__line">
            </div>
            <div class="test">
                <router-link class="test__link" to="/materials">Методические материалы</router-link>
            </div>
            <div class="profile__inner">
                <div class="profile__data">
                    <h1>МОИ ДАННЫЕ</h1>
                    <p>Пожалуйста, проверьте свои личные данные</p>
                    <h1>ДАННЫЕ</h1>
                    
                    <div class="data__user">
                        <h3>Имя: {{ username }}</h3>
                        <h3>Телефон: {{ phone }}</h3>
                        <h3>МУЖСКОЙ</h3>
                        <h3>МОБИЛЬНЫЙ ТЕЛЕФОН</h3>
                        <a href="#">РЕДАКТИРОВАТЬ</a>
                    </div>
                    <h1>ДАННЫЕ ДЛЯ ВХОДА В АККАУНТ</h1>
                    <div class="data__user">
                        <h2>ЭЛ. ПОЧТА</h2>
                        <h4>{{ email }}</h4>
                        <a href="#">РЕДАКТИРОВАТЬ</a>

                        <h2>ПАРОЛЬ</h2>
                        <h4>**************</h4>
                        <a href="#">РЕДАКТИРОВАТЬ</a>
                    </div>
                    <button @click="submitLogOut()" class="profile__logout" href="#">
                        <span>ВЫЙТИ ИЗ АККАУНТА</span>
                        <img src="../assets/profile/arrow.png" alt="">
                    </button>
                </div>
                <!-- <div class="profile__user">
                    <span>{{ username }}</span>
                    <img src="../assets/profile/user.png" width="80" height="80" alt="">
                </div> -->
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import routes from '../router/index'
import settings from '../settings'

export default {
    data() {
        return {
            _success: false,
            username: "",
            email: "",
            city: "",
            phone: "",
        }
    },

    methods: {
        async Auth() {
            let token = localStorage.getItem('token')
            if(token == null) {} else {
                try {
                    axios({
                        method: 'post',
                        url: `${settings.host}/user/loginByToken`,
                        headers: {'Authorization': token}
                    })
                    const infoUser = await axios({
                        method: 'get',
                        url: `${settings.host}/user/infoByToken`,
                        headers: {'Authorization': token}
                    })
                    this.username = infoUser.data.user.name
                    this.email = infoUser.data.user.mail
                    this.phone = infoUser.data.user.number
                    this._success = true
		    localStorage.setItem("name", infoUser.data.user.name)
                } catch (error) {
                    if(error.response.data.message == "jwt expired") {
                        localStorage.removeItem('token')
                    }
                    this._success = false
                }
            }
        },
        submitLogOut() {
            localStorage.removeItem('token')
            this.$router.push({path: "/auth"})
        }
    }
}
</script>

<style scoped>
.profile {
    margin: 20px 0px 0px 0px;
}

/* breadcrumb */
.breadcrumb {
    margin: 5px 0px;
}

.nav__breadcrumb {
    color: #000;
    text-decoration: none;
}

.breadcrumb__line {
    margin-bottom: 50px;   
}
/* end breadcrumb */

.test {
    margin: 0px 0px 20px 155px;
}

.test__link {
    text-decoration: none;
    color: #000;
    margin: 0px 20px 0px 0px;
    font-size: 23px;
    border: 1px solid #000;
    padding: 3px 10px;
}

.profile__inner {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
}

.profile__data {
    margin: 0px 0px 0px 155px;
}

.profile__data > h1 {
    margin: 11px 0px;
}

.data__user {
    margin: 25px 0px;
}

.data__user > h2 {
    margin: 15px 0px 0px 0px;
}

.data__user > h3 {
    font-weight: 300;
    margin: 8px 0px;
}

.data__user > h4 {
    font-weight: 300;
    margin: 8px 0px;
}

.data__user > a {
    text-decoration: none;
    border-bottom: 2px solid #000;
    color: #000;
}

.profile__user {
    display: flex;
    align-items: center;
}

.profile__user > span {
    margin: 0px 10px;
}

.profile__logout {
    border: 1px solid #000;
    padding: 5px 10px;
    text-decoration: none;
    color: #000;
    margin: 5px 0px;
    background-color: #fff;
    cursor: pointer;
}

.profile__logout > span {
    margin: 0px 65px 0px 0px;
}

.vk_form > input {
    padding: 5px 10px;
}

.vk_form > button {
    padding: 5px 10px;
    margin: 0px 10px;
}

.scale__inner {
    display: flex;
    justify-content: space-between;
    margin: 0px 15px;
}

.scale__progress {
    width: 550px;
}

.progress_group {
    margin: 25px 0px 0px 0px;
}
</style>
