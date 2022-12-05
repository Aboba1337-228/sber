<template>
    <div v-if="Access()" class="reg">
        <div class="container">
            <div class="reg__logo">
                <h1>Регистрация</h1><img src="../assets/icon/user.png" alt="">
            </div>
            <h1 style="text-align: center; color: lightgreen; margin: 15px 0px;">{{ _success }}</h1>
            <h1 style="text-align: center; color: red; margin: 15px 0px;">{{ _false }}</h1>
            <form class="reg__form" @submit.prevent="submitPost()">
                <label>ФИО*</label>
                <input v-model="fio" type="text" placeholder="ФИО">
                <label>Номер телефона*</label>
                <input v-model="phone" type="text" placeholder="Телефон">
                <label>Email*</label>
                <input v-model="email" type="text" placeholder="Email">
                <label>Пароль*</label>
                <input v-model="password" type="password" placeholder="Пароль">
                <label>Регион*</label>
                <div class="reg__region">
                    <select v-model="region" name="region">
                        <option v-for="item_r in isMynicipal" :value="item_r">{{ item_r }}</option>
                    </select>
                </div>
                <div class="reg__btn">
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
            fio: "",
            phone: "",
            email: "",
            password: "",
            region: "Оренбург",
            _success: "",
            _false: "",
            interval: null,
	    isMynicipal: []
        }
    },

   mounted: async function() {
            try {
                const resultMynicipal = await axios.post(`${settings.host}/user/mynicipal/`)
                console.log(resultMynicipal)
                for (let index2 = 0; index2 < resultMynicipal.data.message.length; index2++){
                        this.isMynicipal.push(resultMynicipal.data.message[index2].mynicipal)
                }
            } catch(error) {
                console.log(1)
            }
        },


    methods: {
        submitPost() {
            axios.post(`${settings.host}/user/register/`, {                
                name: this.fio,
                number: this.phone,
                mail: this.email,
                password: this.password,
                city: this.region
            }).then(response => {
                console.log(response.data)
                this._success = "Вы усшено зарегистрированны"
                this._false = ""
                this.submitReset()
                this.redirectAuth()
            }).catch(e => {
                console.log(e)
                this._false = "Ошибка регистрации"
                this._success = ""
            })
        },
        async Access() {
            let token = localStorage.getItem('token')
            if(token == null) {} else {
                try {
                    axios({
                        method: 'post',
                        url: `${settings.host}/user/loginByToken`,
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
        redirectAuth() {
            this.interval = setTimeout(
            function () {
                this.$router.push({path: "/auth"})
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
.reg {
    margin: 20px 0px 0px 0px;
}

.reg__logo {
    text-align: center;
    display: flex;
    justify-content: center;
}

.reg__logo > h1 {
    margin: 0px 25px;
}

.reg__form {
    display: flex;
    flex-direction: column;
    max-width: 365px;
    margin: 0 auto;
}

.reg__form > label {
    margin: 13px 0px 5px 0px;
}

.reg__form > input {
    height: 53px;
    padding-left: 10px;
    font-size: 14px;
    box-shadow: 2px 2px 5px rgba(20, 29, 61, 0.15), -2px -2px 5px rgba(20, 29, 61, 0.15);
    border: 0px;
    border-radius: 10px;
    color: #939CA6;
    outline: none;
}

.reg__region {
    position: relative;
    display: inline-block;
}

.reg__region:after {
    content: "▼";
    padding: 0 8px;
    font-size: 12px;
    position: absolute;
    right: 8px;
    top: 20px;
    z-index: 1;
    text-align: center;
    width: 10%;
    height: 100%;
    pointer-events: none;
    box-sizing: border-box;
}

.reg__region > select {
    width: 365px;
    padding-right: 25px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    outline: none;
    height: 53px;
    padding: 0px 10px;
    border: 0px;
    border-radius: 10px;
    box-shadow: 2px 2px 5px rgba(20, 29, 61, 0.15), -2px -2px 5px rgba(20, 29, 61, 0.15);
    font-size: 14px;
}

.reg__btn {
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
