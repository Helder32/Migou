<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArticleFournisseur extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('article_fournisseur', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->integer('fk_article')->unsigned()->index();
            $table->foreign('fk_article')->references('id_article')->on('articles')->ondelete();
            $table->integer('fk_fournisseur')->unsigned()->index();
            $table->foreign('fk_fournisseur')->references('id_fournisseur')->on('fournisseurs')->ondelete();
            $table->integer('quantite');
            $table->date('date');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('article_fournisseur');
    }
}
