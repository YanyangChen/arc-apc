package arc.apc.Abstract;

import java.sql.Connection;

import org.springframework.stereotype.Service;

import acf.acf.Abstract.ACFaBaseService;
import acf.acf.Static.ACFtDBUtility;

@Service
public abstract class APCaAppService extends ACFaBaseService {

    public APCaAppService() throws Exception {
        super();
    }
    
    @Override
    protected Connection getConnection() throws Exception {
        return ACFtDBUtility.getConnection("ARCDB");
    }
}



