
#include "ModelicaUtilities.h"

                        /* 3Dマップで定義されているテーブル名がtab1,tab2..になっているのが前提 */
#define NOEXIST2DMAP 0  /* モデル内でCombiTable2D使用しているなら0,使用していないなら1 */

#if NOEXIST2DMAP
extern void* ModelicaStandardTables_CombiTable2D_init2( _In_z_ const char* fileName,
                                                        _In_z_ const char* tableName,
                                                        _In_ double* table,
                                                        size_t nRow,
                                                        size_t nColumn,
                                                        int smoothness,
                                                        int extrapolation,
                                                        int verbose );
extern double ModelicaStandardTables_CombiTable2D_getValue( void* _tableID,
                                                            double u1,
                                                            double u2 );
#endif

typedef struct
{
    void**  tableID; // x-y軸2Dマップテーブルデータ
    double* zIdx;    // z軸インデックスマップデータ
    size_t  nz;      // z軸要素数
}CombiTable3D;


void* createCombiTable3D( char* fileName, char* tableName, const double *z_ax, size_t t_nz, const double *table, size_t t_nRow, size_t t_nCol, int t_smoothness, int t_extrapolation, int t_verbose )
{
    CombiTable3D* object = (CombiTable3D*)malloc( sizeof( CombiTable3D ) );
    char tabname[64];  // メモリ確保量table名が取り込める程度であればよい
    size_t i;

    if ( object != NULL ) // ExternalObjectの領域確保成功
    {
        object->tableID = (void**)malloc( sizeof( void* )*t_nz );
        if ( object->tableID != NULL )  // x-y軸2Dマップの領域確保成功
        {
            object->zIdx = (double*)malloc( sizeof( double )*t_nz );
            if ( object->zIdx != NULL )  // z軸インデックスの領域確保成功
            {
                for ( i=0; i<t_nz; i++ )
                {
                    // x-y軸マップの初期化
                    sprintf( tabname, "%s%d", "tab", i+1 );
                    object->tableID[i] = ModelicaStandardTables_CombiTable2D_init2( fileName,
                                                                                    /* tableName, 本関数内でtab名作成する */
                                                                                    tabname,
                                                                                    (double*)table,
                                                                                    t_nRow,
                                                                                    t_nCol,
                                                                                    t_smoothness,
                                                                                    t_extrapolation,
                                                                                    t_verbose );

                    if ( object->tableID[i] == NULL )
                    {
                        object = NULL;  // x-y軸2Dマップの領域確保失敗 強制終了
                    }

                    // z軸インデックスの初期化
                    object->zIdx[i] = z_ax[i];

                    ModelicaFormatMessage( "debug : success" );
                }
                object->nz = t_nz;
            }
            else
            {
                object = NULL;  // z軸インデックスの領域確保失敗 強制終了
            }
        }
        else
        {
            object = NULL;  // ExternalObjectの領域確保失敗 強制終了
        }
    }

    return( object );
}


void deleteCombiTable3D( void *object )
{
    CombiTable3D* table = (CombiTable3D*)object;
    size_t i;

    if ( table == NULL )
    {
        return;
    }
    for ( i=0; i< table->nz; i++ )
    {
        free( table->tableID[i] );
    }
    free( table->zIdx );
    free( table->tableID );
    free( table );

    return;
}


double combiTable3D_getValue( void *object, double u1, double u2, double u3 )
{
    CombiTable3D* table = (CombiTable3D*)object;
    double ret;
    double Z1;
    double Z2;
    size_t i;

    ret = (double)0.0;
    Z1 = (double)0.0;
    Z2 = (double)0.0;
    i = (size_t)0;

    if ( u3 <= table->zIdx[0] )
    {
        ret = ModelicaStandardTables_CombiTable2D_getValue( table->tableID[0], u1, u2 );
    }
    else if ( u3 >= table->zIdx[table->nz-1] )
    {
        ret = ModelicaStandardTables_CombiTable2D_getValue( table->tableID[table->nz-1], u1, u2 );
    }
    else
    {
        while( ( table->zIdx[i] < u3 ) && ( i < (table->nz-1) ) )
        {
            i++;
        }
        i--;

        Z1 = ModelicaStandardTables_CombiTable2D_getValue( table->tableID[i], u1, u2 );
        Z2 = ModelicaStandardTables_CombiTable2D_getValue( table->tableID[i+1], u1, u2 );

        ret = Z1 + ( ( Z2 - Z1 ) * ( u3 - table->zIdx[i] ) ) / ( table->zIdx[i+1] - table->zIdx[i] );
    }

    return( ret );
}