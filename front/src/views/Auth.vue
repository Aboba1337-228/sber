<template>
    <div v-if="Access()" class="auth">
        <div class="container">
            <div class="auth__logo">
                <h1>Авторизация</h1><img src="../assets/icon/user.png" alt="">
            </div>
            <h1 style="text-align: center; color: lightgreen; margin: 15px 0px;">{{ _success }}</h1>
            <h1 style="text-align: center; color: red; margin: 15px 0px;">{{ _false }}</h1>
            <form class="auth__form" @submit.prevent="submitAuth()">
                <label>Email*</label>
                <input v-model="email" type="text" placeholder="Email">
                <label>Пароль*</label>
                <input v-model="password" type="password" placeholder="Пароль">
                <div class="auth__btn">
                    <button @click.prevent="submitReset()" class="reset">Очистить</button>
                    <button class="further">Далее</button>
                </div>
            </form>
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
            email: "",
            password: "",
            _success: "",
            _false: ""
        }
    },

    methods: {
        async submitAuth() {
            try {
                const result = await axios.post(`${settings.host}/user/login`, {
                    mail: this.email,
                    password: this.password
                })
                localStorage.setItem('token', result.data.token)
                this.redirectProfile()
            } catch (error) {
                this._false = "Логин или Пароль не верный"
            }
        },  

        async Access() {
            let token = localStorage.getItem('token')
            if(token == null) {} else {
                try {
                    axios({
                        method: 'post',
                        url: `http://${settings.host}/user/loginByToken`,
                        headers: {'Authorization': token}
                    })
                    this.$router.push({path: "/profile"})
                } catch (error) {
                    if(error.response.data.message == "jwt expired") {
                        localStorage.removeItem('token')
                    }
                    this._access = false
                }
            }
        },

        redirectProfile() {
            this.interval = setTimeout(
            function () {
                this.$router.push({path: "/profile"})
            }.bind(this), 1200);
        },
        submitReset() {
            this.fio = "",
            this.phone = "",
            this.email = "",
            this.password = "",
            this.region = ""
        }
    }
}
</script>

<style scoped>
.auth {
    margin: 120px 0px 0px 0px;
}

.auth__logo {
    text-align: center;
    display: flex;
    justify-content: center;
}

.auth__logo > h1 {
    margin: 0px 25px;
}

.auth__form {
    display: flex;
    flex-direction: column;
    max-width: 365px;
    margin: 0 auto;
}

.auth__form > label {
    margin: 13px 0px 5px 0px;
}

.auth__form > input {
    height: 53px;
    padding-left: 10px;
    font-size: 14px;
    box-shadow: 2px 2px 5px rgba(20, 29, 61, 0.15), -2px -2px 5px rgba(20, 29, 61, 0.15);
    border: 0px;
    border-radius: 10px;
    color: #939CA6;
    outline: none;
}

.auth__btn {
    display: flex;
    justify-content: space-between;
    margin: 35px 0px;
}

.reset {
    border: 0px;
    background-color: #fff;
    width: 165px;
    height: 59px;
    font-size: 16px;
    cursor: pointer;
}

.further {
    width: 165px;
    height: 59px;
    border: 1px solid #4A607A;
    background-color: #fff;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}

</style>
