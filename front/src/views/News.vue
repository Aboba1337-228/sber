<template>
    <div class="news">
        <div class="container">
            <div class="breadcrumb">
                <router-link class="nav__breadcrumb" to="/">Главная</router-link>
                 / <router-link class="nav__breadcrumb" to="/news" @click="isListNews = ''">Новости</router-link>
                <span v-if="isListNews"> / №{{ isListNews }}</span>
            </div>
            <hr class="breadcrumb__line">
        </div>
        <div class="news__container" v-if="isListNews == ''">
            <h1>Новости</h1>
            
            <div class="news__card" v-for="itemNews in isNumberNews" :key="itemNews">
                <img :src="itemNews.news_image" width="130" height="70" alt="">
                <div class="card__info">
                    <a @click="isListNews = itemNews.id">{{ itemNews.name_news }}</a>
                    <p>{{itemNews.date_news}}</p>
                </div>
            </div>
        </div>
     
        <div v-for="itemMainNews in isNumberNews" :key="itemMainNews">
            <div class="news__container news__selected" v-if="isListNews == itemMainNews.id">
                <img :src="itemMainNews.news_image" width="350" height="200" alt="">
                <h3>{{itemMainNews.name_news}}</h3>
                <p align="justify">{{itemMainNews.discript_news}}</p>
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
            isListNews: '',
            isNumberNews: []
        }
    },
    mounted: async function() {
        try {
            const resultNews = await axios({
                method: 'post',
                url: `${settings.host}/user/news`,
            })
            let result = resultNews.data.message
            let quiz = []
            for (let index = result.length; index >= 0; index--) {
                quiz.push(result[index])
            }

            quiz = quiz.filter(function( element ) {
                return element !== undefined;
            });
            this.isNumberNews = quiz
        } catch (error) {
            this.isMaterialsFalse = "Материалы не загруженны!"
        }
    },
}
</script>

<style scoped>
.news {
    margin: 20px 0px 0px 0px;
}

.breadcrumb {
    margin-bottom: 5px;
}

.nav__breadcrumb {
    color: #000;
    text-decoration: none;
}

.breadcrumb__line {
    margin-bottom: 50px;   
}

.news__container {
    max-width: 1000px;
    margin: 0 auto;
}

.news__container > h1 {
    text-align: center;
    font-size: 30px;
    margin: 30px 0px;
}

.news__selected > h3 {
    margin: 20px 0px;
}

.news__card {
    display: flex;
    align-items: flex-start;
    margin: 25px 0px;
}

.card__info {
    margin: 0px 0px 0px 20px;
}

.card__info > a {
    text-decoration: none;
    font-size: 18px;
    color: #000;
    border-bottom: 1px solid #000;
    cursor: pointer;
}

.card__info > p {
    font-size: 14px;
    color: #bfbfbf;
    margin-top: 8px;
}

</style>
