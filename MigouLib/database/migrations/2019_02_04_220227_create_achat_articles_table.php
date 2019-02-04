<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAchatArticlesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
            Schema::create('achat_article', function (Blueprint $table) {
                $table->increments('id');
                $table->timestamps();
                $table->integer('fk_achat')->unsigned()->index();
                $table->foreign('fk_achat')->references('id_achat')->on('achats')->ondelete();
                $table->integer('fk_article')->unsigned()->index();
                $table->foreign('fk_article')->references('id_article')->on('articles')->ondelete();
                $table->integer('quantite');
                $table->integer('remise_forfaitaire')->nullable();   
            });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('achat_articles');
    }
}
