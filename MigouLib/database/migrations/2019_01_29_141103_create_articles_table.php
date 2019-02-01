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
            $table->boolean('secteur_bd')->nullable()->default(false);
            $table->boolean('secteur_jeunesse')->nullable()->default(false);
            $table->boolean('secteur_roman')->nullable()->default(false);
            $table->boolean('secteur_occasion')->nullable()->default(false);
            $table->boolean('cat_manga')->nullable()->default(false);
            $table->boolean('cat_comics')->nullable()->default(false);
            $table->boolean('cat_franco_belge')->nullable()->default(false);
            $table->boolean('cat_roman_graphique')->nullable()->default(false);
            $table->boolean('cat_alternatif')->nullable()->default(false);
            $table->boolean('cat_docu_bd')->nullable()->default(false);
            $table->boolean('cat_album')->nullable()->default(false);
            $table->boolean('cat_activite')->nullable()->default(false);
            $table->boolean('cat_divers')->nullable()->default(false);
            $table->boolean('cat_roman')->nullable()->default(false);
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
