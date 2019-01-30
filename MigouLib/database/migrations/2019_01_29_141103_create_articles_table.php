<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArticlesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('articles', function (Blueprint $table) {
            $table->increments('id_article');
            $table->timestamps();
            $table->string('titre_livre', 100)->nullable();
            $table->float('tome_livre')->nullable();
            $table->integer('isbn')->nullable()->unique();
            $table->date('date_parution')->nullable();
            $table->string('auteur_livre', 100)->nullable();
            $table->string('editeur', 100)->nullable();
            $table->string('distrbuteur', 100)->nullable();
            $table->string('diffuseur', 100)->nullable();
            $table->string('secteur_livre', 100)->nullable();
            $table->string('rayon_livre', 100)->nullable();
            $table->float('bon_achat')->nullable();
            $table->string('repas', 100)->nullable();
            $table->string('boisson', 100)->nullable();
            $table->string('dessert_divers', 100)->nullable();
            $table->float('prix_achat')->nullable();
            $table->float('remise_achat')->nullable();
            $table->float('taux_tva');
            $table->float('prix_ht');
            $table->float('prix_ttc');
            $table->tinyInteger('secteur_bd', 1)->nullable();
            $table->tinyInteger('secteur_jeunesse', 1)->nullable();
            $table->tinyInteger('secteur_roman', 1)->nullable();
            $table->tinyInteger('secteur_occasion', 1)->nullable();
            $table->tinyInteger('cat_manga', 1)->nullable();
            $table->tinyInteger('cat_comics', 1)->nullable();
            $table->tinyInteger('cat_franco_belge', 1)->nullable();
            $table->tinyInteger('cat_roman_graphique', 1)->nullable();
            $table->tinyInteger('cat_alternatif', 1)->nullable();
            $table->tinyInteger('cat_docu_bd', 1)->nullable();
            $table->tinyInteger('cat_album', 1)->nullable();
            $table->tinyInteger('cat_activite', 1)->nullable();
            $table->tinyInteger('cat_divers', 1)->nullable();
            $table->tinyInteger('cat_roman', 1)->nullable();
            $table->integer('qt_dispo_fournisseur')->nullable();
            $table->integer('qt_stock')->nullable();
            $table->integer('qt_depot')->nullable();
            $table->integer('qt_reservation')->nullable();
            $table->integer('qt_commande_fournisseur')->nullable();
            $table->integer('valeur_total_stock');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('articles');
    }
}
