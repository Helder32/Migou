<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAchatsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('achats', function (Blueprint $table) {
            $table->increments('id_achat');
            $table->timestamps();
            $table->string('type_vente', 100);
            $table->string('mode_paiement', 100)->nullable();
            $table->date('date_paiement')->nullable();
            $table->date('date_commande')->nullable();
            $table->date('date_livraison')->nullable();
            $table->boolean('statut_paiement')->nullable()->default(false);
            $table->date('date_jour');
            $table->integer('id_client')->unsigned()->index();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('achats');
    }
}
