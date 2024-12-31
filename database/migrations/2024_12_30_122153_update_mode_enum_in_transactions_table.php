<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('transactions', function (Blueprint $table) {
            // Update the enum column
            $table->enum('mode', ['transfer', 'card', 'paypal'])
                  ->default('transfer')
                  ->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('transactions', function (Blueprint $table) {
            // Revert back to the original enum values
            $table->enum('mode', ['cod', 'card', 'paypal'])
                  ->default('cod')
                  ->change();
        });
    }
};
