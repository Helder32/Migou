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
            $table->string('nom', 100)->nullable();
            $table->float('tome_livre')->nullable();
            $table->integer('isbn')->nullable()->unique();
            $table->date('date_parution')->nullable();
            $table->string('auteur', 100)->nullable();
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
            $table->string('secteur_bd', 100)->nullable()->default(false);
            $table->string('secteur_jeunesse', 100)->nullable()->default(false);
            $table->string('secteur_roman', 100)->nullable()->default(false);
            $table->string('secteur_occasion', 100)->nullable()->default(false);
            $table->string('cat_manga', 100)->nullable()->default(false);
            $table->string('cat_comics', 100)->nullable()->default(false);
            $table->string('cat_franco_belge', 100)->nullable()->default(false);
            $table->string('cat_roman_graphique', 100)->nullable()->default(false);
            $table->string('cat_alternatif', 100)->nullable()->default(false);
            $table->string('cat_docu_bd', 100)->nullable()->default(false);
            $table->string('cat_album', 100)->nullable()->default(false);
            $table->string('cat_activite', 100)->nullable()->default(false);
            $table->string('cat_divers', 100)->nullable()->default(false);
            $table->string('cat_roman', 100)->nullable()->default(false);
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
