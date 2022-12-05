<template>
    <h1 v-if="isSuccess == false" style="text-align: center; color: red; margin: 15px 0px 50px 0px;">Сначала авторизируйтесь</h1>
    <div class="main__materials" >
        <div v-if="isSuccess == true">
            <div v-if="isList == 0">
                <div>
                    <div class="breadcrumb"><router-link class="nav__breadcrumb" to="/">Главная</router-link> / Материалы</div>
                    <hr class="breadcrumb__line">
                </div>
                <div class="test__inner">
                    <div class="test__menu">
                    <h1>ВЫБОР МАТЕРИАЛА</h1>
                        <div  class="link__inner">
                            <div v-for="itemFullMaterials in isFullMaterials" :key="itemFullMaterials">
                                <div class="test__link" @click="isMaterialActive = itemFullMaterials.test_id" >
                                    {{ itemFullMaterials.name_materials }}
                                </div>

                                <div v-if="isMaterialActive == itemFullMaterials.test_id" class="materials__inner">
                                    <h2 @click="isTraining = !isTraining">Программа обучения</h2>
                                    <a v-if="isTraining == true" href="/pdf/Учебный план по УИК ООЦ ВЫБОРЫ.pdf">
                                        <h2>
                                            <img src="../assets/materials/pdf.png" class="materials__pdf" width="50" height="50" alt="">
                                            Учебный план по УИК ООЦ ВЫБОРЫ
                                        </h2>
                                    </a>

                                    <h2 @click="isMethodical = !isMethodical">Учебно-методические материалы</h2>
                                    <div v-if="false" class="materials">{{ itemsFullMaterials.materials }}</div>
                                    <a v-if="isMethodical == true" href="/pdf/Тема_1.pptx">
                                        <img src="/pdf/тема.jpg" class="materials__pdf" width="500" height="250" alt="">   
                                    </a>

                                    <a v-if="isMethodical == true" href="/pdf/Модуль 2. Делопроизводство в УИК. Основные избирательные документу, составляемые УМК.pdf">
                                        <h2><img src="../assets/materials/pdf.png" class="materials__pdf" width="50" height="50" alt="">
                                        Модуль 1. Законодательство Российской Федерации о выборах. Положение УИК в системе избирательных комиссий. Организация и планирование деятельности УИК	
                                        </h2>
                                    </a>

                                    <a v-if="isMethodical == true" href="/pdf/Модуль 2. Делопроизводство в УИК. Основные избирательные документу, составляемые УМК.pdf">
                                        <h2><img src="../assets/materials/pdf.png" class="materials__pdf" width="50" height="50" alt="">
                                        Модуль 2. Делопроизводство в УИК. Основные избирательные документы составляемые УИК
                                    </h2>
                                    </a>

                                    <a v-if="isMethodical == true" href="/pdf/Модуль 2. Делопроизводство в УИК. Основные избирательные документу, составляемые УМК.pdf">
                                        <h2><img src="../assets/materials/pdf.png" class="materials__pdf" width="50" height="50" alt="">
                                        Модуль 3. Работа УИК с момента начала осуществения избирательных действий до дня, предсшествующего дня голосования
                                        </h2>
                                    </a>

                                    <h2 @click="isInst = !isInst">Инструкция</h2>
                                    <a v-if="isInst == true" href="/pdf/Памятка Организация работы УИК.pptx">
                                        <h2>
                                            <img src="../assets/materials/pdf.png" class="materials__pdf" width="50" height="50" alt="">
                                            Памятка Организация работы УИК
                                        </h2>
                                    </a>
                                    <router-link :to="'/test/' + itemFullMaterials.test_id" class="test__ready">Начать тест</router-link>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>     
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import settings from '../settings'

export default {
    data() {
        return {
            isMaterialsFalse: "",
            isTestFalse: "",
            isFullMaterials: [],
            isTestQuest: [],
            isAnswer: [],
            isMaterialActive: 0,
            isTestActive: 0,
            isSuccess: false,
            isList: "",
            isVerifyAnswer: [],
            isVerifySelectAnswer: [],
	        isNextR: [],
            //Materials
            isTraining: false,
            isMethodical: false,
            isInst: false
        }
    },

    mounted: async function () {
	    this.Access();
        try {
            const resultMaterials = await axios({
                method: 'post',
                url: `${settings.host}/user/materials`,
            })
            this.isFullMaterials = resultMaterials.data.message
        } catch (error) {
            this.isMaterialsFalse = "Материалы не загруженны!"
        }   
    },

    methods: {
        async Access() {
            let token = localStorage.getItem('token')
            if(token == null) {} else {
                try {
                    axios({
                        method: 'post',
                        url: `${settings.host}/user/loginByToken`,
                        headers: {'Authorization': token}
                    })
                    this.isSuccess = true
                } catch (error) {
                    if(error.response.data.message == "jwt expired") {
                        localStorage.removeItem('token')
                    }
                    this.isSuccess = false
                }
            }
        }
    }
}
</script>

<style scoped>
table {
    margin: 15px 0px;
}

th, td {
    border: 1px solid #000;
}

td {
    padding: 0px 5px;
}

.primary {
    background: lightgreen;
}

.primaryRed {
    background: lightcoral;
}
.h22 {
    text-align: center;
    color: red;
}

.button2 {
    width: 165px;
    height: 59px;
    font-weight: 500;
    background: rgb(28, 176, 246);
    border-radius: 7px;
    border: none;
    color: rgb(255, 255, 255);
    box-shadow: rgb(34 155 213) 0px 4px 0px;
    padding: 6px 20px;
    font-size: 20px;
    transition: all 0.3s ease-in-out 0s;
    cursor: pointer;
    box-sizing: border-box;
    text-decoration: none;
}


h2 {
    text-align: center;
    color: #000;
}

.verify {
    display: grid;
    justify-content: center;
    margin: 25px 0px;
}

.verify > a > button {
    width: 80px;
    height: 30px;
    margin: 10px 0px;
}

.verify > a {
    text-decoration: none;
    color: #000;
}

form {
    display: flex;
    flex-direction: column;
    max-width: 350px;
    margin: 0 auto;
}

form > input {
    margin: 5px 0px;
    height: 30px;
    font-size: 20px;
    padding-left: 5px;
}

form > button {
    margin: 5px 0px;
    height: 30px;
    font-size: 20px;
}
a h2 {
	display: flex;
	align-items: center;
}
a {
	text-decoration: none;
}
.main__materials {
    margin: 20px 0px;
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

.test__inner {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 0px 100px;
}

.test__menu {
  margin: 75px 0px 0px 0px;
}

.test__menu > h1 {
  font-weight: 400;
  font-size: 36px;
  text-align: left;
}

.link__inner {
  display: grid;
  align-items: flex-start;
  flex-wrap: wrap;
  margin: 55px 0px;
}

.link__inner > div > div {
    width: 1000px;
    padding-left: 20px;
}

.test__link {
  border: 1px solid #000;
  display: flex;
  align-items: center;
  /* justify-content: center; */
  width: 1000px;
  height: 79px;
  text-decoration: none;
  color: #000;
  margin: 10px;
  /* border-radius: 6px; */
  font-weight: bold;
  font-size: 20px;
  cursor: pointer;
}

.materials {
    margin: 30px 0px 0px 0px;
    overflow-y: scroll;
    width: 1000px;
    height: 500px;
    background: #eeeeee;
    padding: 10px;
}

.materials__inner {
    display: grid;
    justify-content: center;
}

.materials__pdf {
    margin: 25px 0px;
}

.materials__inner > h2 {
    border: 1px solid #000;
    width: 900px;
    height: 50px;
    display: flex;
    align-items: center;
    padding-left: 10px;
    cursor: pointer;
    margin: 13px 0px;
    color: #000;
}

.materials__inner > h2 > a {
    text-decoration: none;
    color: #000;
}

.test__ready {
    border: 1px solid #000;
    width: 900px;
    height: 50px;
    display: flex;
    align-items: center;
    padding-left: 10px;
    cursor: pointer;
    margin: 13px 0px;
    color: #000;
    font-size: 24px;
    font-weight: bold;
}

</style>
